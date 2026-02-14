import 'package:dio/dio.dart';

abstract interface class AuthRemoteDataSource {
  Future<Response<dynamic>> requestCode(String email);
  Future<Response<dynamic>> confirmCode(String email, String code);
  Future<Response<dynamic>> getUserData(String jwt);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource{
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://d5dsstfjsletfcftjn3b.apigw.yandexcloud.net',
  ));
  
  @override
  Future<Response<dynamic>> requestCode(String email) async {
    final response = await _dio.post('/login', data: {'email': email});
    return response;
  }

  @override
  Future<Response<dynamic>> confirmCode(String email, String code) async {
    final response = await _dio.post('/confirm_code', data: {
      'email': email,
      'code': code,
    });
    return response;
  }

  @override
  Future<Response<dynamic>> getUserData(String jwt) async {
    final response = await _dio.get('/auth', options: Options(
      headers: {
        'Auth': 'Bearer $jwt',
      },
    ),);
    return response;
  }
}