import 'package:aveds_test/features/auth/data/data_sources/remote_data_source.dart';
import 'package:aveds_test/features/auth/data/dto/jwt_rt_dto.dart';
import 'package:aveds_test/features/auth/domain/entity/jwt_rt.dart';
import 'package:aveds_test/features/auth/domain/repository/auth_repository.dart';
import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Object, String>> requestCode(String email) async {
    try {
      final Response<dynamic> response = await remoteDataSource.requestCode(email);
      if (_success(response)) {
        final String info = response.data['info'];
        return Right(info);
      }
      return Left('error statusCode $response.statusCode');
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Object, JwtRt>> confirmCode(String email, String code) async {
    try {
      final Response<dynamic> response = await remoteDataSource.confirmCode(email, code);
      if (_success(response)) {
        final JwtRtDto jwtRt = JwtRtDto.fromJson(response.data);
        return Right(jwtRt);
      }
      return Left('error statusCode $response.statusCode');
    } catch (e) {
      return Left(e);
    }
  }

  bool _success(Response<dynamic> response) => 
    response.statusCode != null && response.statusCode! ~/ 100 == 2;
}