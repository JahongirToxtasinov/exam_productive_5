part of 'auth_bloc.dart';

abstract class AuthenticatedEvent {}
class AuthenticatedUser extends AuthenticatedEvent {}

class CreateUserAuth extends AuthenticatedEvent {
  final String emailText;
  final String passwordText;
  final VoidCallback onSuccess;

  final ValueChanged<String> onFailure;

  CreateUserAuth({
    required this.emailText,
    required this.passwordText,
    required this.onSuccess,
    required this.onFailure,
  });
}

class LogoutUser extends AuthenticatedEvent {}

class LoginUserAuth extends AuthenticatedEvent {
  final String emailText;
  final String passwordText;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;

  LoginUserAuth({
    required this.emailText,
    required this.passwordText,
    required this.onSuccess,
    required this.onFailure,
  });
}
