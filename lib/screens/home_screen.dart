import 'package:flutter/material.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleLogout(BuildContext context) {
    // pushReplacementNamed sends the user back to Login and removes
    // Home from the stack, so the back button won't return here.
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the name passed as an argument from the Login or Sign Up screen.
    final args = ModalRoute.of(context)!.settings.arguments;
    final String username = (args is String && args.isNotEmpty) ? args : 'Guest';

    return Scaffold(
      backgroundColor: AppColors.menuBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Header bar
            Container(
              width: double.infinity,
              color: AppColors.headerBrown,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'WELCOME, ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            username,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _handleLogout(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.headerBrown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                    ),
                    child: const Text(
                      'Log out',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            // Coffee menu
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Image.asset(
                      'assets/images/menu.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
