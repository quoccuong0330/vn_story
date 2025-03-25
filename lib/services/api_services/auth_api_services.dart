import 'package:dio/dio.dart';
import 'package:vn_story/network_service/api_response/login_response.dart';
import 'package:vn_story/services/dio_interceptor.dart';

class ApiService {
  final Dio _dio = DioConfig.createDio();

  Future<bool> login(Map<String, dynamic> loginData) async {
    try {
      Response response = await _dio.post('/token/', data: loginData);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('🔥 Lỗi khi gọi API: $e');
      throw Exception('Đăng nhập thất bại');
    }
  }
}
