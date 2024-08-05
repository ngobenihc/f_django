import 'package:flutter/material.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final ApiService _apiService = ApiService();

  void _forgotPassword() async {
    final response = await _apiService.forgotPassword(
      _emailController.text,
    );
    if (response.statusCode == 200) {
      // Email sent successfully
    } else {
      // Handle error
      print('Forgot password failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: 'Email',
              controller: _emailController,
            ),
            CustomButton(
              text: 'Send Reset Link',
              onPressed: _forgotPassword,
            ),
          ],
        ),
      ),
    );
  }
}
