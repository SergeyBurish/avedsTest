part of 'auth_cubit.dart';

enum AuthStatus {
  idle,
  inProgress,
  success,
  error,
}

@CopyWith(constructor: '_')
class AuthState {
  final AuthStatus status;
  final String email;
  final String code;
  final String codeSendEmail;
  final String message;

  AuthState({
    required this.status,
    required this.email,
    required this.code,
    required this.codeSendEmail,
    required this.message,
  });

  AuthState._({
    required this.status,
    required this.email,
    required this.code,
    required this.codeSendEmail,
    required this.message,
  });

  AuthState.initial() :
    status = AuthStatus.idle,
    email = '',
    code = '',
    codeSendEmail = '',
    message = '';

  bool get isError => status == AuthStatus.error;
  bool get emailVerifying => 
    email.isNotEmpty && code.isNotEmpty && email == codeSendEmail;
}
