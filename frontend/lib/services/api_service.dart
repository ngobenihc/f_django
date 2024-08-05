import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:8000/api/users';

  Future<http.Response> signUp(String username, String email, String password) {
    return http.post(
      Uri.parse('$baseUrl/signup/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
      }),
    );
  }

  Future<http.Response> login(String email, String password) {
    return http.post(
      Uri.parse('$baseUrl/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
  }

  Future<http.Response> getProfile(String token) {
    return http.get(
      Uri.parse('$baseUrl/profile/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<http.Response> updateProfile(String token, Map<String, String> data) {
    return http.put(
      Uri.parse('$baseUrl/profile/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
  }

  Future<http.Response> forgotPassword(String email) {
    return http.post(
      Uri.parse('$baseUrl/forgot-password/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );
  }

  Future<http.Response> resetPassword(String uid, String token, String newPassword) {
    return http.post(
      Uri.parse('$baseUrl/reset-password/$uid/$token/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'new_password': newPassword,
      }),
    );
  }
}
