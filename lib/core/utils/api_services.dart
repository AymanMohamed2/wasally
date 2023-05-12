import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://cloud.appwrite.io/v1/';
  final Dio dio;
  ApiServices(this.dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint, required var headers}) async {
    var response =
        await dio.get('$_baseUrl$endPoint', options: Options(headers: headers));
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required var data,
    required var headers,
  }) async {
    var response = await dio.post('$_baseUrl$endPoint',
        options: Options(headers: headers), data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required var data,
    required var headers,
  }) async {
    var response = await dio.put('$_baseUrl$endPoint',
        options: Options(headers: headers), data: data);
    return response.data;
  }

  Future<void> delete({
    required String endPoint,
    required var headers,
  }) async {
    await dio.delete('$_baseUrl$endPoint', options: Options(headers: headers));
  }
}
