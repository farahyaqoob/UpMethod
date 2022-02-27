part of 'user_bloc.dart';

@immutable
abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final UserResponse userResponse;
  const UserLoaded(this.userResponse);
}

class UserFailure extends UserState {
  final String msg;
  const UserFailure(this.msg);
}
