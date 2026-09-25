import 'package:flutter/material.dart';

// Colors used across the Login, Sign Up, and Home screens.
// Keeping them in one place makes the app's design consistent.
class AppColors {
  static const Color background = Color(0xFFF5EDE2);
  static const Color headerBrown = Color(0xFF9C6B3F);
  static const Color buttonBrown = Color(0xFFB48D6C);
  static const Color fieldFill = Color(0xFFE7D6C2);
  static const Color textDark = Color(0xFF3E2C1C);
  static const Color textBrown = Color(0xFF8B5E3C);
}

// Reusable pill-shaped input decoration for text fields.
InputDecoration appFieldDecoration({
  required String hint,
  required IconData icon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: Color(0xFF8A7A66)),
    prefixIcon: Icon(icon, color: AppColors.textBrown, size: 20),
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: AppColors.fieldFill,
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: AppColors.textBrown, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
    ),
  );
}

// Reusable pill-shaped button used by both the Login and Sign Up screens.
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AppButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBrown,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
