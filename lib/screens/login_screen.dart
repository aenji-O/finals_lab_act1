import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Form key is used to validate all fields at once when Log in is pressed.
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Navigator.pushReplacementNamed replaces the Login screen with Home,
      // so the user cannot go "back" into the login form after logging in.
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: _usernameController.text.trim(),
      );
    }
  }

  void _goToSignUp() {
    // Navigator.pushNamed keeps Login on the stack so Sign Up can pop back to it.
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/login_logo.png',
                  height: 300,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 14),
                const Text(
                  'Spring Coffee',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textBrown,
                    fontSize: 22,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  'LOG IN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 22),
                TextFormField(
                  controller: _usernameController,
                  validator: _validateUsername,
                  style: const TextStyle(color: AppColors.textDark),
                  decoration: appFieldDecoration(
                    hint: 'Username',
                    icon: Icons.person_outline,
                  ),
                ),
                const SizedBox(height: 14),
                PasswordField(
                  controller: _passwordController,
                  hint: 'Password',
                  validator: _validatePassword,
                ),
                const SizedBox(height: 26),
                AppButton(label: 'Log in', onPressed: _handleLogin),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account? ",
                      style: TextStyle(color: AppColors.textDark),
                    ),
                    GestureDetector(
                      onTap: _goToSignUp,
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: AppColors.textBrown,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
