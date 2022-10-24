// events send by the ui to the bloc to send to datamodel

abstract class UserEvent {
  UserEvent();
}

class UserSplashScreenEvent extends UserEvent {}

class AuthUserEvevnt extends UserEvent {}

class AuthOtpUserEvevnt extends UserEvent {}

class AuthGetHelpUserEvevnt extends UserEvent {}
