import 'package:dio/dio.dart';

abstract interface class AuthRemoteDataSource {
  Future<int?> requestCode(String email);
  Future<int?> confirmCode(String email, String code);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource{
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://d5dsstfjsletfcftjn3b.apigw.yandexcloud.net',
  ));
  
  @override
  Future<int?> requestCode(String email) async {
    final response = await _dio.post('/login', data: {'email': email});
    print('zzz requestCode response.statusCode ${response.statusCode}');
    return response.statusCode;
  }

  @override
  Future<int?> confirmCode(String email, String code) async {
    final response = await _dio.post('/confirm_code', data: {
      'email': email,
      'code': code,
    });
    print('sendCode response.statusCode ${response.statusCode}');
    return response.statusCode;
  }
}