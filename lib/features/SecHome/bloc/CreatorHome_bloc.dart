
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:webapp/features/SecHome/bloc/CreatorHome_event.dart';
import 'package:webapp/features/SecHome/bloc/CreatorHome_state.dart';
import 'package:webapp/features/auth/data/repositories/auth_repositories.dart';

class CreatorHomeBloc extends Bloc<CreatorHomeEvent, CreatorHomeState> {
  static final CreatorHomeBloc _singleton = CreatorHomeBloc._internal();

  factory CreatorHomeBloc() {
    return _singleton;
  }

  CreatorHomeBloc._internal() : super(CheckAuthState()) {
    on<AuthCreatorHomeEvent>(authCreatorHomeEvent);
    on<NotAuthCreatorHomeEvent>(notAuthCreatorHomeEvent);
    on<CheckAuthEvent>(checkAuthEvent);

  }



  FutureOr<void> authCreatorHomeEvent(AuthCreatorHomeEvent event, Emitter<CreatorHomeState> emit) {



  }

  FutureOr<void> notAuthCreatorHomeEvent(NotAuthCreatorHomeEvent event, Emitter<CreatorHomeState> emit) {
  }

  FutureOr<void> checkAuthEvent(CheckAuthEvent event, Emitter<CreatorHomeState> emit) {
    if(authRepositoryInstance.name != null) {
      emit(AuthCreatorHomeState());
    } else {
      emit(NotAuthCreatorHomeState());
    }
  }
}
