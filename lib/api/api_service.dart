import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://admin.kushinirestaurant.com/api';

  static Future<void> sendOtp(String phoneNumber) async {
    final url = Uri.parse('$baseUrl/verify/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phone_number': phoneNumber}),
    );
    print(response.body);
    if (response.statusCode != 200) {
      throw Exception('Failed to send OTP. Please try again.');
    }
  }

  static Future<bool> verifyOtp(String phoneNumber, String otp) async {
    final url = Uri.parse('$baseUrl/login-register/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phone_number': phoneNumber, 'otp': otp}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['verified'] ?? false;
    } else {
      throw Exception('OTP verification failed. Please try again.');
    }
  }
}
