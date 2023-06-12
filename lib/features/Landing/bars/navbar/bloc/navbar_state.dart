import 'package:flutter/material.dart';

@immutable
abstract class NavBarState {}

abstract class NavBarActionState extends NavBarState {}

class NavBarAuthState extends NavBarState {}

class NavBarNavigateToSigninPageState extends NavBarActionState {}



class NavBarNotAuthenticatedState extends NavBarState {}

class NavBarSignOutButtonClickedState extends NavBarActionState {}
