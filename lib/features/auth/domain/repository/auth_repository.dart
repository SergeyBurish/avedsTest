import 'package:aveds_test/features/auth/domain/entity/jwt_rt.dart';
import 'package:dart_either/dart_either.dart';

abstract interface class AuthRepository {
  Future<Either<Object, String>> requestCode(String email);
  Future<Either<Object, JwtRt>> confirmCode(String email, String code);
}