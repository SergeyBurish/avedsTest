import 'package:aveds_test/features/auth/domain/repository/auth_repository.dart';
import 'package:dart_either/dart_either.dart';

abstract interface class AuthManager{
    Future<Either<Object, void>> requestCode(String email);
}
class AuthUsecase implements AuthManager{
  final AuthRepository repository;

  AuthUsecase({required this.repository});

  @override
  Future<Either<Object, void>> requestCode(String email) async {
    return repository.requestCode(email);
  }
}