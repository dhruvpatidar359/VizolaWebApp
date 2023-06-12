import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webapp/features/Landing/bars/navbar/bloc/navbar_event.dart';
import 'package:webapp/features/Landing/bars/navbar/bloc/navbar_state.dart';
import 'package:webapp/features/auth/data/repositories/auth_repositories.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  static final NavBarBloc _singleton = NavBarBloc._internal();

  factory NavBarBloc() {
    return _singleton;
  }

  NavBarBloc._internal() : super(NavBarAuthState()) {
    on<NavBarAuthenticatedEvent>(navBarAuthEvent);
    on<NavBarNavigateToSigninPageEvent>(navBarLoginPressedEvent);
    on<NavBarSignOutClickedEvent>(navBarSignOutPressedEvent);
  }

  Future<FutureOr<void>> navBarAuthEvent(
      NavBarAuthenticatedEvent event, Emitter<NavBarState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isAuth = prefs.getBool('auth');
    if (isAuth == false) {

      emit(NavBarNotAuthenticatedState());
    } else {
      emit(NavBarAuthState());
    }
  }

  FutureOr<void> navBarLoginPressedEvent(
      NavBarNavigateToSigninPageEvent event, Emitter<NavBarState> emit) {
    emit(NavBarNavigateToSigninPageState());
  }

  Future<FutureOr<void>> navBarSignOutPressedEvent(
      NavBarSignOutClickedEvent event, Emitter<NavBarState> emit) async {
    await authRepositoryInstance.signOut();
    emit(NavBarNotAuthenticatedState());
  }
}
