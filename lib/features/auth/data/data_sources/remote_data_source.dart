import 'package:dio/dio.dart';

abstract interface class AuthRemoteDataSource {
  Future<void> requestCode(String email);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource{
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://d5dsstfjsletfcftjn3b.apigw.yandexcloud.net',
  ));
  
  @override
  Future<void> requestCode(String email) async {
    final response = await _dio.post('/login', data: {'email': email});
    print('response.statusCode ${response.statusCode}');
  }
}