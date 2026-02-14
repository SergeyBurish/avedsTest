import 'package:dart_either/dart_either.dart';

abstract interface class AuthRepository {
  Future<Either<Object, void>> requestCode(String email);
  Future<Either<Object, void>> confirmCode(String email, String code);
}