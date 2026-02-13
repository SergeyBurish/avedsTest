part of 'auth_cubit.dart';

@CopyWith(constructor: '_')
class AuthState {
  final String email;

  AuthState({required this.email});

  AuthState._({
    required this.email,
  });

  AuthState.initial() :
    email = '';
}
