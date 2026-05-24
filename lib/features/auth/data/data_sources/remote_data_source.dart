import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medica/config/erorr/serverexception.dart';
import 'package:medica/features/auth/data/models/user_model.dart';
import 'package:medica/features/auth/domain/entities/user_entity.dart';

class FirebaseAuthServic {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthServic(this._firebaseAuth);

  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = credential.user!;
      return UserEntity(
        uid: user.uid,
        email: user.email!,
        name: user.displayName ?? "",
        phone: user.phoneNumber ?? "",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ServerException(message: e.toString());
      } else if (e.code == 'wrong-password') {
        throw ServerException(message: e.toString());
      } else {
        throw ServerException(message: e.toString());
      }
    }
  }

  Future<UserEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = credential.user!;

      final userProfile = UserModel(
        uid: user.uid,
        email: user.email!,
        name: name,
        phone: phone,
        photoURL: user.photoURL,
      );
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        print("Verification email sent");
      }
      return userProfile;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ServerException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ServerException(
          message: 'The account already exists for that email.',
        );
      } else {
        throw ServerException(message: e.toString());
      }
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<UserEntity> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);

    final User user = userCredential.user!;
    return UserEntity(
      uid: user.uid,
      email: user.email!,
      name: user.displayName ?? "",
      phone: user.phoneNumber ?? "",
    );
  }

  Future<UserEntity> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        facebookAuthCredential,
      );

      final User user = userCredential.user!;

      return UserEntity(
        uid: user.uid,
        email: user.email ?? "",
        name: user.displayName ?? "",
        phone: user.phoneNumber ?? "",
      );
    } else {
      throw ServerException(
        message: 'Facebook login failed or cancelled: ${loginResult.message}',
      );
    }
  }
}
