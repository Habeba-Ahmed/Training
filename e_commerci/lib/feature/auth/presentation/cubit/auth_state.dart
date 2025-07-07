part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthSignUpSuccess extends AuthState {}
class AuthSignUpFailed extends AuthState {
  final String message;
  AuthSignUpFailed(this.message);
}
final class AuthSignInSuccess extends AuthState {}
class AuthSignInFailed extends AuthState {
  final String message;
  AuthSignInFailed(this.message);
}

final class AuthResetEmailSuccess extends AuthState {}
class AuthResetEmailFailed extends AuthState {
  final String message;
  AuthResetEmailFailed(this.message);
}


final class AuthResetPasswordSuccess extends AuthState {}
class AuthResetPasswordFailed extends AuthState {
  final String message;
  AuthResetPasswordFailed(this.message);
}



final class AuthLoading extends AuthState {}


