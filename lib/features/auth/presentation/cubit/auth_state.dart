part of 'auth_cubit.dart';


class AuthState {
  final String value;

  AuthState({required this.value});

  AuthState._({
    required this.value,
  });

  AuthState.initial() :
    value = '';
}
