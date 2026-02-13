import 'package:dio/dio.dart';

abstract interface class AuthRemoteDataSource {
  Future<void> requestCode(String email);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource{
  static const _baseUrl = '';
  final Dio _dio = Dio();
  
  @override
  Future<void> requestCode(String email) async {
    final response = await _dio.get(_baseUrl);
    print('response.statusCode ${response.statusCode}');
  }
}