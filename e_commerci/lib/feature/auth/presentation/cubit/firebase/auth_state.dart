part of 'auth_cubit.dart';

sealed class AuthStateFireBase {}

final class AuthInitialFireBase extends AuthStateFireBase {}
final class AuthSignUpSuccessFireBase extends AuthStateFireBase {}
class AuthSignUpFailedFireBase extends AuthStateFireBase {
  final String message;
  AuthSignUpFailedFireBase(this.message);
}

final class AuthSignInSuccessFireBase extends AuthStateFireBase {}
class AuthSignInFailedFireBase extends AuthStateFireBase {
  final String message;
  AuthSignInFailedFireBase(this.message);
}

final class AuthSignInSuccessFaceBookFireBase extends AuthStateFireBase {}
class AuthSignInFailedFaceBookFireBase extends AuthStateFireBase {
  final String message;
  AuthSignInFailedFaceBookFireBase(this.message);
}



final class AuthResetPasswordSuccessFireBase extends AuthStateFireBase {}
class AuthResetPasswordFailedFireBase extends AuthStateFireBase {
  final String message;
  AuthResetPasswordFailedFireBase(this.message);
}



final class AuthLoadingFireBase extends AuthStateFireBase {}


