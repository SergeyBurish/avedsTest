import 'package:aveds_test/features/auth/data/data_sources/remote_data_source.dart';
import 'package:aveds_test/features/auth/domain/repository/auth_repository.dart';
import 'package:dart_either/dart_either.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Object, void>> requestCode(String email) async {
    try {
      remoteDataSource.requestCode(email);
      return const Right(null);
    } catch (e) {
      return Left(e);
    }
  }
  
}