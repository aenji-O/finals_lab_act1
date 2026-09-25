import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/password_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailPattern = RegExp(r'^[\w\.\-]+@[\w\-]+\.[a-zA-Z]{2,}$');
    if (!emailPattern.hasMatch(value.trim())) {
      return 'Enter a valid email address';
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      // pushReplacementNamed swaps Sign Up out for Home on the stack,
      // this is a different Navigator method than the pushNamed/pop
      // used to move between Login and Sign Up.
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: _usernameController.text.trim(),
      );
    }
  }

  void _goToLogin() {
    // Navigator.pop returns to the Login screen that is already on the stack.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.signupBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/signup_logo.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 2),
                const Text(
                  'Spring Coffee',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textBrown,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'SIGN UP',
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
                TextFormField(
                  controller: _emailController,
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: AppColors.textDark),
                  decoration: appFieldDecoration(
                    hint: 'Email',
                    icon: Icons.mail_outline,
                  ),
                ),
                const SizedBox(height: 14),
                PasswordField(
                  controller: _passwordController,
                  hint: 'Password',
                  validator: _validatePassword,
                ),
                const SizedBox(height: 14),
                PasswordField(
                  controller: _confirmPasswordController,
                  hint: 'Confirm Password',
                  validator: _validateConfirmPassword,
                ),
                const SizedBox(height: 26),
                AppButton(label: 'Sign up', onPressed: _handleSignUp),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an Account? ',
                      style: TextStyle(color: AppColors.textDark),
                    ),
                    GestureDetector(
                      onTap: _goToLogin,
                      child: const Text(
                        'Log in',
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
