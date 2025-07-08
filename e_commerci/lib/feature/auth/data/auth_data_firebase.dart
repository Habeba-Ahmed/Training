import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthDateFirebase {

// Future<UserCredential?> signInWithGoogle() async {
//   try {
//     // Trigger the Google Sign-In flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     // If the user cancels the login
//     if (googleUser == null) return null;

//     // Get the authentication details
//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//     // Create the Firebase credential
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.idToken,
//       idToken: googleAuth.idToken,
//     );

//     // Sign in with Firebase and return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   } catch (e) {
//     print('Google sign-in error: $e');
//     return null;
//   }
// }


Future<(bool, String?)> signInWithFacebook() async {
  try {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final accessToken = result.accessToken!;
      final credential = FacebookAuthProvider.credential(accessToken.tokenString);
      await FirebaseAuth.instance.signInWithCredential(credential);
      return (true, null);
    } else {
      return (false, result.message ?? "Facebook login failed.");
    }
  } on FirebaseAuthException catch (e) {
    return (false, e.message ?? "Firebase error.");
  } catch (e) {
    return (false, "Unknown error occurred.");
  }
}



  Future<(bool, String?)> signIn({
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    return (true, null);
  } on FirebaseAuthException catch (e) {
    String errorMessage;
    switch (e.code) {
      case 'user-not-found':
        errorMessage = 'No user found for this email.';
        break;
      case 'wrong-password':
        errorMessage = 'Incorrect password.';
        break;
      case 'invalid-email':
        errorMessage = 'Invalid email format.';
        break;
      case 'user-disabled':
        errorMessage = 'This user has been disabled.';
        break;
      default:
        errorMessage = e.message ?? 'Login failed. Please try again.';
    }
    return (false, errorMessage);
  } catch (e) {
    return (false, "Something went wrong. Please try again.");
  }
}




  Future<(bool, String?)> signUp({
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return (true, null);
  } on FirebaseAuthException catch (e) {
    String errorMessage;
    switch (e.code) {
      case 'email-already-in-use':
        errorMessage = 'This email is already registered.';
        break;
      case 'invalid-email':
        errorMessage = 'The email format is invalid.';
        break;
      case 'weak-password':
        errorMessage = 'Password should be at least 6 characters.';
        break;
      default:
        errorMessage = e.message ?? 'Unknown error occurred.';
    }
    return (false, errorMessage);
  } catch (e) {
    return (false, "Something went wrong. Please try again.");
  }
}

Future<(bool, String?)> resetPassword({
  required String email,
}) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    return (true, null);
  } on FirebaseAuthException catch (e) {
    String errorMessage;
    switch (e.code) {
      case 'invalid-email':
        errorMessage = 'The email address is not valid.';
        break;
      case 'user-not-found':
        errorMessage = 'No user found with this email.';
        break;
      default:
        errorMessage = e.message ?? 'An unknown error occurred.';
    }
    return (false, errorMessage);
  } catch (e) {
    return (false, "Something went wrong. Please try again.");
  }
}





}
