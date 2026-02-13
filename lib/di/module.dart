import 'package:aveds_test/features/auth/data/data_sources/remote_data_source.dart';
import 'package:aveds_test/features/auth/data/repository/auth_repository.dart';
import 'package:aveds_test/features/auth/domain/repository/auth_repository.dart';
import 'package:aveds_test/features/auth/domain/usecase/auth_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Module {
  @lazySingleton
  AuthRemoteDataSource remoteDataSource() => AuthRemoteDataSourceImp();

  @lazySingleton
  AuthRepository authRepository(AuthRemoteDataSource remoteDataSource) =>
      AuthRepositoryImp(remoteDataSource: remoteDataSource);

  @lazySingleton
  AuthManager currencyProducer(AuthRepository repository) =>
      AuthUsecase(repository: repository);
}