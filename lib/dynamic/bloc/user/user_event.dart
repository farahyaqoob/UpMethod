part of 'user_bloc.dart';

@immutable
abstract class UserEvent {
  const UserEvent();
}

class GetUserEvent extends UserEvent {
  const GetUserEvent();
}
