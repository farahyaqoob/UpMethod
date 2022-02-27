import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:up_method_mobile_app/dynamic/firebase/auth_repository.dart';
import 'package:up_method_mobile_app/dynamic/models/auth_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  AuthRepository _authRepository = AuthRepository();
  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    // ***GOOGLE***
    if (event is LoginWithGoogleEvent) {
      try {
        yield AuthLoading();
        User user = await _authRepository.signInWithGoogle();
        AuthModel authModel =
            await _authRepository.firebaseUserToAuthModel(user);
        yield AuthLoaded(authModel);
      } on Exception {
        yield AuthFailure("Network Error");
      }
    } else if (event is LogoutWithGoogleEvent) {
      try {
        await _authRepository.signOutWithGoogle();
      } on Exception {
        yield AuthFailure("Network Error");
      }
    }
    // ***FACEBOOK***
    else if (event is LoginWithFacebookEvent) {
      try {
        yield AuthLoading();
        User user = await _authRepository.signInWithFacebook();
        AuthModel authModel =
            await _authRepository.firebaseUserToAuthModel(user);
        yield AuthLoaded(authModel);
      } on Exception {
        yield AuthFailure("Network Error");
      }
    } else if (event is LogoutWithGoogleEvent) {
      try {
        await _authRepository.signInWithFacebook();
      } on Exception {
        yield AuthFailure("Network Error");
      }
    }
    // ***EMAIL-PASSWORD***
    else if (event is RegisterWithEmailAndPassEvent) {
      try {
        yield AuthLoading();
        User user = await _authRepository.registerWithEmailAndPassword(
            event.email, event.pass);
        AuthModel authModel =
            await _authRepository.firebaseUserToAuthModel(user);
        yield AuthLoaded(authModel);
      } on Exception {
        yield AuthFailure("Network Error");
      }
    } else if (event is LoginWithEmailAndPassEvent) {
      try {
        yield AuthLoading();
        User user = await _authRepository.signInWithEmailAndPassword(
            event.email, event.pass);
        AuthModel authModel =
            await _authRepository.firebaseUserToAuthModel(user);
        yield AuthLoaded(authModel);
      } on Exception {
        yield AuthFailure('Network Error');
      }
    } else if (event is LogoutEvent) {
      try {
        await _authRepository.signOut();
        yield AuthInitial();
      } on Exception {
        yield AuthFailure("Network Error");
      }
    }
  }
}
