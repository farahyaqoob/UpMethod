import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:up_method_mobile_app/dynamic/local_storage/shared_preference.dart';
import 'package:up_method_mobile_app/dynamic/models/auth_model.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthRepository {
  //INITIALIZATIONS
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SharedPref sharedPref = SharedPref();
  GoogleSignIn _googleSignIn = GoogleSignIn();

  // METHODS
  Future<User> getCurrentFirebaseUser() async {
    User currentUser;
    currentUser = _auth.currentUser;
    return currentUser;
  }

  // CHECK IF USER IS PRESENT OR NOT
  AuthModel _userFromFirebaseUser(User user) {
    if (user != null) {
      return AuthModel(
          uid: user.uid,
          email: user.email,
          photo: user.photoURL,
          name: user.displayName);
    } else {
      return null;
    }
  }

  // STATE MANAGEMENT THROUGH STREAM-PROVIDER\
  Stream<AuthModel> get getUserForState {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //SIGN IN WITH GOOGLE
  Future signInWithGoogle() async {
    GoogleSignInAccount _signInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication _signInAuthentication =
        await _signInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: _signInAuthentication.accessToken,
        idToken: _signInAuthentication.idToken);

    User user = (await _auth.signInWithCredential(credential)).user;
    return _userFromFirebaseUser(user);
  }

  //SIGN OUT WITH GOOGLE
  Future<void> signOutWithGoogle() async {
    await _auth.signOut();
    // await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
  }

  //SIGN IN WITH FB
  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'user_birthday']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken.token);

    // Once signed in, return the UserCredential
    User user = (await _auth.signInWithCredential(facebookAuthCredential)).user;
    return user;
  }

  //LOGOUT WITH FB
  Future<void> signOutWithFacebook() async {
    await _auth.signOut();
    await FacebookAuth.instance.logOut();
  }

  //SIGNIN WITH EMAIL AND PASSWORD
  Future signInWithEmailAndPassword(String email, String password) async {
    String status = '';
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      status = e.message;
    }
    return status;
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    String status = '';
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      status = e.message;
    }
    return status;
  }

  // sign out
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //TO CONVERT CURRENT FIREBASE USER INTO AUTH MODEL
  Future<AuthModel> firebaseUserToAuthModel(User user) async {
    return AuthModel(
        uid: user.uid,
        email: user.email,
        photo: user.photoURL,
        name: user.displayName);
  }
}
