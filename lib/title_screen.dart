import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../orb_shader/orb_shader_config.dart';
import 'orb_shader/orb_shader_widget.dart';
import '../styles.dart';


class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen>
    with SingleTickerProviderStateMixin {
  final _orbKey = GlobalKey<OrbShaderWidgetState>();

  /// Editable Settings
  /// 0-1, receive lighting strength
  // final _minReceiveLightAmt = .35;
  // final _maxReceiveLightAmt = .7;

  // /// 0-1, emit lighting strength
  // final _minEmitLightAmt = .5;
  // final _maxEmitLightAmt = 1;

  /// Internal
  var _mousePos = Offset.zero;

  Color get _emitColor =>
      AppColors.emitColors[_difficultyOverride ?? _difficulty];
  Color get _orbColor =>
      AppColors.orbColors[_difficultyOverride ?? _difficulty];

  /// Currently selected difficulty
  int _difficulty = 0;

  /// Currently focused difficulty (if any)
  int? _difficultyOverride;
  double _orbEnergy = 0;
  double _minOrbEnergy = 0;



  late final _pulseEffect = AnimationController(
    vsync: this,
    duration: _getRndPulseDuration(),
    lowerBound: -1,
    upperBound: 1,
  );

  Duration _getRndPulseDuration() => 100.ms + 200.ms * Random().nextDouble();



  @override
  void initState() {
    super.initState();
    _pulseEffect.forward();

  }

  void _handleMouseMove(PointerHoverEvent e) {
    setState(() {
      _mousePos = e.localPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: MouseRegion(
          onHover: _handleMouseMove,
          child: _AnimatedColors(
            orbColor: _orbColor,
            emitColor: _emitColor,
            builder: (_, orbColor, emitColor) {
              return Stack(
                children: [
                  /// Bg-Base

                  /// Orb
                  Positioned.fill(
                    child: Stack(
                      children: [

                        OrbShaderWidget(
                          key: _orbKey,
                          mousePos: _mousePos,
                          minEnergy: _minOrbEnergy,
                          config: OrbShaderConfig(
                            ambientLightColor: orbColor,
                            materialColor: orbColor,
                            lightColor: orbColor,
                          ),
                          onUpdate: (energy) => setState(() {
                            _orbEnergy = energy;
                          }),
                        ),



                      ],
                    ),
                  ),


                  /// UI

                ],
              ).animate().fadeIn(duration: 1.seconds, delay: .3.seconds);
            },
          ),
        ),
      ),
    );
  }
}


class _AnimatedColors extends StatelessWidget {
  const _AnimatedColors({
    required this.emitColor,
    required this.orbColor,
    required this.builder,
  });

  final Color emitColor;
  final Color orbColor;

  final Widget Function(BuildContext context, Color orbColor, Color emitColor)
  builder;

  @override
  Widget build(BuildContext context) {
    final duration = .5.seconds;
    return TweenAnimationBuilder(
      tween: ColorTween(begin: emitColor, end: emitColor),
      duration: duration,
      builder: (_, emitColor, __) {
        return TweenAnimationBuilder(
          tween: ColorTween(begin: orbColor, end: orbColor),
          duration: duration,
          builder: (context, orbColor, __) {
            return builder(context, orbColor!, emitColor!);
          },
        );
      },
    );
  }
}