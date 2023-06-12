import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:webapp/features/Landing/bars/navbar/bloc/navbar_bloc.dart';
import 'package:webapp/features/Landing/bars/navbar/bloc/navbar_event.dart';
import 'package:webapp/features/Landing/bars/navbar/navbar.dart';

import '../data/repositories/auth_repositories.dart';
import 'auth_events.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final NavBarBloc navBarBloc = NavBarBloc();
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    // When User Presses the Google Login Button, we will send the GoogleSignInRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<GoogleSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signInWithGoogle(event.isSME);

        emit(Authenticated());
        
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
