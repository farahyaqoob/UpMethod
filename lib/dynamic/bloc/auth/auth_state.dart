part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthLoaded extends AuthState {
  final AuthModel authModel;
  const AuthLoaded(this.authModel);
}

class AuthFailure extends AuthState {
  final String msg;
  const AuthFailure(this.msg);
}
