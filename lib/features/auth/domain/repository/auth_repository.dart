import 'package:aveds_test/features/auth/domain/entity/jwt_rt.dart';
import 'package:aveds_test/features/auth/domain/entity/user_profile.dart';
import 'package:dart_either/dart_either.dart';

abstract interface class AuthRepository {
  Future<Either<Object, String>> requestCode(String email);
  Future<Either<Object, JwtRt>> confirmCode(String email, String code);
  Future<Either<Object, JwtRt>> refreshCredentials(String token);
  Future<Either<Object, UserProfile>> getUserData(String jwt);
}