import 'package:flutter/material.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  void _signUp() async {
    final response = await _apiService.signUp(
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
    );
    if (response.statusCode == 201) {
      Navigator.pushNamed(context, '/login');
    } else {
      // Handle error
      print('Signup failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: 'Username',
              controller: _usernameController,
            ),
            CustomTextField(
              label: 'Email',
              controller: _emailController,
            ),
            CustomTextField(
              label: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
            CustomButton(
              text: 'Sign Up',
              onPressed: _signUp,
            ),
          ],
        ),
      ),
    );
  }
}
