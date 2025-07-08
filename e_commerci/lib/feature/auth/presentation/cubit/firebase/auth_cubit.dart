import 'package:bloc/bloc.dart';
import 'package:e_commerci/feature/auth/data/auth_data_firebase.dart';

part 'auth_state.dart';

class AuthCubitFireBase extends Cubit<AuthStateFireBase> {
  AuthCubitFireBase() : super(AuthInitialFireBase());

  AuthDateFirebase data=AuthDateFirebase();

Future<void> signIn({
  required String email,
  required String password,
}) async {
  emit(AuthLoadingFireBase());

  final result = await data.signIn(email: email, password: password);

  if (result.$1) {
    emit(AuthSignInSuccessFireBase());
  } else {
    emit(AuthSignInFailedFireBase(result.$2 ?? "SignIn failed"));
  }
}

Future<void> signInFaceBook() async {
  emit(AuthLoadingFireBase());

  final result = await data.signInWithFacebook();

  if (result.$1) {
    print('sssssssssssssssssssssssssssssssssssssss');
    emit(AuthSignInSuccessFaceBookFireBase());
  } else {
    emit(AuthSignInFailedFaceBookFireBase(result.$2 ?? "SignIn failed"));
  }
}
Future<void> signUp({
  required String email,
  required String password,
  required String confirmpassword,
}) async {
  emit(AuthLoadingFireBase());

  if (password != confirmpassword) {
    emit(AuthSignUpFailedFireBase("Passwords do not match"));
    return;
  }

  final result = await data.signUp(email: email, password: password);

  if (result.$1) {
    emit(AuthSignUpSuccessFireBase());
  } else {
    emit(AuthSignUpFailedFireBase(result.$2 ?? "Sign-up failed"));
  }
}


Future<void> resetPassword({
  required String email,
}) async {
  emit(AuthLoadingFireBase());

  final result = await data.resetPassword(email: email);

  if (result.$1) {
    emit(AuthResetPasswordSuccessFireBase());
  } else {
    emit(AuthResetPasswordFailedFireBase(result.$2 ?? "Reset password failed"));
  }
}

}
