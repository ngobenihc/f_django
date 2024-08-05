import 'package:flutter/material.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/custom_button.dart';
import 'package:frontend/widgets/custom_text_field.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final ApiService _apiService = ApiService();

  void _updateProfile() async {
    final response = await _apiService.updateProfile(
      'your-token-here',
      {
        'username': _usernameController.text,
        'email': _emailController.text,
        'first_name': _firstNameController.text,
        'last_name': _lastNameController.text,
      },
    );
    if (response.statusCode == 200) {
      // Profile updated successfully
    } else {
      // Handle error
      print('Profile update failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
              label: 'First Name',
              controller: _firstNameController,
            ),
            CustomTextField(
              label: 'Last Name',
              controller: _lastNameController,
            ),
            CustomButton(
              text: 'Update Profile',
              onPressed: _updateProfile,
            ),
          ],
        ),
      ),
    );
  }
}
