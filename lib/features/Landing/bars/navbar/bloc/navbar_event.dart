abstract class NavBarEvent {}

class NavBarAuthenticatedEvent extends NavBarEvent {}

class NavBarNavigateToSigninPageEvent extends NavBarEvent {}

class NavBarSignOutClickedEvent extends NavBarEvent {}
