// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthStateCWProxy {
  AuthState email(String email);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthState call({String email});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAuthState.copyWith(...)` or call `instanceOfAuthState.copyWith.fieldName(value)` for a single field.
class _$AuthStateCWProxyImpl implements _$AuthStateCWProxy {
  const _$AuthStateCWProxyImpl(this._value);

  final AuthState _value;

  @override
  AuthState email(String email) => call(email: email);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthState call({Object? email = const $CopyWithPlaceholder()}) {
    return AuthState._(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
    );
  }
}

extension $AuthStateCopyWith on AuthState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAuthState.copyWith(...)` or `instanceOfAuthState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthStateCWProxy get copyWith => _$AuthStateCWProxyImpl(this);
}
