import 'package:aveds_test/features/auth/data/data_sources/remote_data_source.dart';
import 'package:aveds_test/features/auth/domain/repository/auth_repository.dart';
import 'package:dart_either/dart_either.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Object, void>> requestCode(String email) async {
    try {
      final int? statusCode = await remoteDataSource.requestCode(email);
      if (statusCode != null && statusCode ~/ 100 == 2) {
        return const Right(null);
      }
      return Left('error statusCode $statusCode');
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Object, void>> confirmCode(String email, String code) async {
    try {
      final int? statusCode = await remoteDataSource.confirmCode(email, code);
      if (statusCode != null && statusCode ~/ 100 == 2) {
        return const Right(null);
      }
      return Left('error statusCode $statusCode');
    } catch (e) {
      return Left(e);
    }
  }
}