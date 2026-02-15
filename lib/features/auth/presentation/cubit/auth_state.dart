part of 'auth_cubit.dart';

enum AuthStatus {
  idle,
  inProgress,
  codeRequestSuccess,
  codeConfirmSuccess,
  getUserDataSuccess,
  error,
}

@CopyWith(constructor: '_')
class AuthState {
  final AuthStatus status;
  final String email;
  final String code;
  final String codeSendEmail;
  final String jwt;
  final String refreshToken;
  final String userId;
  final String message;

  AuthState({
    required this.status,
    required this.email,
    required this.code,
    required this.codeSendEmail,
    required this.jwt,
    required this.refreshToken,
    required this.userId,
    required this.message,
  });

  AuthState._({
    required this.status,
    required this.email,
    required this.code,
    required this.codeSendEmail,
    required this.jwt,
    required this.refreshToken,
    required this.userId,
    required this.message,
  });

  AuthState.initial() :
    status = AuthStatus.idle,
    email = '',
    code = '',
    codeSendEmail = '',
    jwt = '',
    refreshToken = '',
    userId = '',
    message = '';

  bool get inProgress => status == AuthStatus.inProgress;
  bool get codeRequestSuccess => status == AuthStatus.codeRequestSuccess;
  bool get codeConfirmSuccess => status == AuthStatus.codeConfirmSuccess;
  bool get getUserDataSuccess => status == AuthStatus.getUserDataSuccess;
  bool get error => status == AuthStatus.error;
  bool get emailIsEmpty => email.isEmpty;
  bool get emailIsValid => EmailValidator.validate(email);
  bool get emailVerifying => 
    email.isNotEmpty && code.isNotEmpty && email == codeSendEmail;
}
