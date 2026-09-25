import 'package:flutter/material.dart';
import '../constants.dart';

// A password TextFormField with the lock icon on the left (prefix)
// and the show/hide eye icon on the far right (suffix) of the field.
class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?) validator;

  const PasswordField({
    super.key,
    required this.controller,
    required this.hint,
    required this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      style: const TextStyle(color: AppColors.textDark),
      decoration: appFieldDecoration(
        hint: widget.hint,
        icon: Icons.lock_outline,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.textBrown,
            size: 20,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
    );
  }
}
