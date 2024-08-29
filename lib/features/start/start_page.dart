import 'package:daily_hogwarts/core/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/hogwarts.png'),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Welcome to\nDaily Hogwarts!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomFilledButton(
                    title: 'Login',
                    onPressed: () {},
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  CustomFilledButton(
                    title: 'Sign Up',
                    onPressed: () {},
                    backgroundColor: Colors.deepPurple.shade100,
                    foregroundColor: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
