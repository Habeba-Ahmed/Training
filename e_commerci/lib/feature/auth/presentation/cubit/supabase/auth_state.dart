part of 'auth_cubit.dart';

sealed class AuthStateSupaBase {}

final class AuthInitial extends AuthStateSupaBase {}
final class AuthSignUpSuccess extends AuthStateSupaBase {}
class AuthSignUpFailed extends AuthStateSupaBase {
  final String message;
  AuthSignUpFailed(this.message);
}
final class AuthSignInSuccess extends AuthStateSupaBase {}
class AuthSignInFailed extends AuthStateSupaBase {
  final String message;
  AuthSignInFailed(this.message);
}

final class AuthResetEmailSuccess extends AuthStateSupaBase {}
class AuthResetEmailFailed extends AuthStateSupaBase {
  final String message;
  AuthResetEmailFailed(this.message);
}


final class AuthResetPasswordSuccess extends AuthStateSupaBase {}
class AuthResetPasswordFailed extends AuthStateSupaBase {
  final String message;
  AuthResetPasswordFailed(this.message);
}



final class AuthLoading extends AuthStateSupaBase {}


