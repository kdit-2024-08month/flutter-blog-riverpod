import 'package:dio/dio.dart';
import 'package:flutter_blog/_core/utils/my_http.dart';

class UserRepository {
  Future<Map<String, dynamic>> autoLogin(String accessToken) async {
    final response = await dio.post(
      "/auto/login",
      options: Options(headers: {"Authorization": "Bearer $accessToken"}),
    );

    Map<String, dynamic> body = response.data;
    return body;
  }

  Future<(Map<String, dynamic>, String)> login(
      String username, String password) async {
    final response = await dio
        .post("/login", data: {"username": username, "password": password});

    String accessToken = response.headers["Authorization"]![0];

    // List<String> cookies = response.headers["Set-Cookie"]!;
    // String jSessionId = cookies.where((element) => element.contains("jSessionId")).first;
    // dio.options.headers["cookie"] = dio.options.headers["cookie"] + ";jsessionId=$jSessionId";

    Map<String, dynamic> body = response.data;
    return (body, accessToken);
  }
}
