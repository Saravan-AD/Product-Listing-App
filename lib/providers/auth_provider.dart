import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _token = '';
  String _phoneNumber='';
  String get token => _token;
  String get phoneNumber => _phoneNumber;

  // Set the token after successful login
  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  // Verify OTP after sending phone number
  Future<bool> validateOtp(String phoneNumber, String otp) async {
    final url = Uri.parse('https://admin.kushinirestaurant.com/api/verify/');

    // Send phone number and OTP to validate
    final response = await http.get(
      url.replace(queryParameters: {
        'phone_number': phoneNumber,
        'otp': otp,  // Assuming the API expects OTP to be passed as query parameter.
      }),
      headers: {'Content-Type': 'application/json'},
    );

    print(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['otp'] == otp) {
        // OTP is correct, store the token
        final token = data['token']['access'];
        setToken(token); // Store the token in your state management solution
        return true;
      } else {
        return false; // OTP is incorrect
      }
    } else {
      throw Exception('Failed to validate OTP');
    }
  }

  // Send the phone number to check user existence
  Future<bool> verifyUser(String phoneNumber) async {
    final url = Uri.parse('https://admin.kushinirestaurant.com/api/verify/');

    final response = await http.post(
      url,
      body: json.encode({'phone_number': phoneNumber}),
      headers: {'Content-Type': 'application/json'},
    );

    print(response.body);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['user'] == 'true';
    } else {
      return false;
    }
  }

  // Login/Register the user
  Future<void> loginUser(String firstName, String phoneNumber) async {
    final url = Uri.parse('https://admin.kushinirestaurant.com/api/login-register/');

    final response = await http.post(
      url,
      body: json.encode({
        'first_name': firstName,
        'phone_number': phoneNumber,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token']['access'];
      setToken(token); // Store the token
       _phoneNumber=phoneNumber;
    } else {
      throw Exception('Failed to register or login');
    }
  }
}
