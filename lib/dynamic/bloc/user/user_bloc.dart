import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:up_method_mobile_app/dynamic/models/user_response.dart';
import 'package:up_method_mobile_app/dynamic/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());
  UserRepository userRepository = UserRepository();
  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // GET ALL
    if (event is GetUserEvent) {
      try {
        yield UserLoading();
        UserResponse userResponse = await userRepository.getUser();
        yield UserLoaded(userResponse);
      } on Exception {
        yield UserFailure("Network Error");
      }
    }
    // --------------------------------------------------
  }
}
