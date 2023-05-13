part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class PasswordVisibilityState extends AuthState {}

class LoginState extends AuthState {}

class SignupState extends AuthState {}
