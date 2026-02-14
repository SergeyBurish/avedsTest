import 'package:aveds_test/features/auth/domain/entity/jwt_rt.dart';
import 'package:aveds_test/features/auth/domain/repository/auth_repository.dart';
import 'package:dart_either/dart_either.dart';

abstract interface class AuthManager{
    Future<Either<Object, String>> requestCode(String email);
    Future<Either<Object, JwtRt>> confirmCode(String email, String code);
}
class AuthUsecase implements AuthManager{
  final AuthRepository repository;

  AuthUsecase({required this.repository});

  @override
  Future<Either<Object, String>> requestCode(String email) async {
    return repository.requestCode(email);
  }

  @override
  Future<Either<Object, JwtRt>> confirmCode(String email, String code) async {
    return repository.confirmCode(email, code);
  }
}