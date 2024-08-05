import 'package:flutter/material.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  void _resetPassword() async {
    final response = await _apiService.resetPassword(
      'uid',
      'token',
      _passwordController.text,
    );
    if (response.statusCode == 200) {
      // Password reset successfully
    } else {
      // Handle error
      print('Reset password failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: 'New Password',
              controller: _passwordController,
              obscureText: true,
            ),
            CustomButton(
              text: 'Reset Password',
              onPressed: _resetPassword,
            ),
          ],
        ),
      ),
    );
  }
}
