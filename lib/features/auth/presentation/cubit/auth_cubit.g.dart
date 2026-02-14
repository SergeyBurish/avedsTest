// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthStateCWProxy {
  AuthState status(AuthStatus status);

  AuthState email(String email);

  AuthState code(String code);

  AuthState codeSendEmail(String codeSendEmail);

  AuthState message(String message);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthState call({
    AuthStatus status,
    String email,
    String code,
    String codeSendEmail,
    String message,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAuthState.copyWith(...)` or call `instanceOfAuthState.copyWith.fieldName(value)` for a single field.
class _$AuthStateCWProxyImpl implements _$AuthStateCWProxy {
  const _$AuthStateCWProxyImpl(this._value);

  final AuthState _value;

  @override
  AuthState status(AuthStatus status) => call(status: status);

  @override
  AuthState email(String email) => call(email: email);

  @override
  AuthState code(String code) => call(code: code);

  @override
  AuthState codeSendEmail(String codeSendEmail) =>
      call(codeSendEmail: codeSendEmail);

  @override
  AuthState message(String message) => call(message: message);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? codeSendEmail = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return AuthState._(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AuthStatus,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      codeSendEmail:
          codeSendEmail == const $CopyWithPlaceholder() || codeSendEmail == null
          ? _value.codeSendEmail
          // ignore: cast_nullable_to_non_nullable
          : codeSendEmail as String,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $AuthStateCopyWith on AuthState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAuthState.copyWith(...)` or `instanceOfAuthState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthStateCWProxy get copyWith => _$AuthStateCWProxyImpl(this);
}
