import 'package:bloc/bloc.dart';
import 'package:e_commerci/feature/auth/data/auth_data.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthDate data=AuthDate();


Future<void> signUp({
  required String email,
  required String password,
  required String confirmpassword,
}) async {
  emit(AuthLoading());
  if(password !=confirmpassword){
    emit(AuthSignUpFailed("Password Don't Match"));
    return;
  }
  final result = await data.signUp(email: email, password: password);

  if (result.$1) {
    emit(AuthSignUpSuccess());
  } else {
    emit(AuthSignUpFailed(result.$2 ?? "SignIn failed"));
  }
}

Future<void> signIn({
  required String email,
  required String password,
}) async {
  emit(AuthLoading());

  final result = await data.signIn(email: email, password: password);

  if (result.$1) {
    emit(AuthSignInSuccess());
  } else {
    emit(AuthSignInFailed(result.$2 ?? "SignIn failed"));
  }
}

Future<void> resetEmail({
  required String email,
}) async {
  emit(AuthLoading());

  final result = await data.resetEmail(email: email,);

  if (result.$1) {
    emit(AuthResetEmailSuccess());
  } else {
    emit(AuthResetEmailFailed(result.$2 ?? "SignIn failed"));
  }
}

Future<void> updatePassword(String newPassword,String confirmpassword,String email) async {
  emit(AuthLoading());
  if(newPassword !=confirmpassword){
    emit(AuthResetPasswordFailed("Password Don't Match"));
    return;
  }
  final result = await data.updatePassword(newPassword,email);
  if (result.$1) {
    emit(AuthResetPasswordSuccess());
  } else {
    emit(AuthResetPasswordFailed(result.$2 ?? "Reset failed"));
  }
}



}
