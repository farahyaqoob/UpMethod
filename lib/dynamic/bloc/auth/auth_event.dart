part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class SetInitialStateEvent extends AuthEvent {
  const SetInitialStateEvent();
}

class LoginWithGoogleEvent extends AuthEvent {
  const LoginWithGoogleEvent();
}

class LogoutWithGoogleEvent extends AuthEvent {
  const LogoutWithGoogleEvent();
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class LoginWithFacebookEvent extends AuthEvent {
  const LoginWithFacebookEvent();
}

class LogoutWithFacebookEvent extends AuthEvent {
  const LogoutWithFacebookEvent();
}

class RegisterWithEmailAndPassEvent extends AuthEvent {
  final String email;
  final String pass;
  const RegisterWithEmailAndPassEvent(this.email, this.pass);
}

class LoginWithEmailAndPassEvent extends AuthEvent {
  final String email;
  final String pass;
  const LoginWithEmailAndPassEvent(this.email, this.pass);
}
