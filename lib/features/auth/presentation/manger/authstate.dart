import 'package:medica/features/auth/domain/entities/user_entity.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class GoogleLoading extends AuthState {}

class FacebookLoading extends AuthState {}

class RegisterLoading extends AuthState {}

class ForgotPasswordLoading extends AuthState {}

class SignOutLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserEntity user;

  AuthSuccess({required this.user});
}

class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}
