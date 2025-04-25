import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Auth Screen!'),
            ElevatedButton(
              onPressed: () {
                // Add your authentication logic here
              },
              child: const Text('Authenticate'),
            ),
          ],
        ),
      ),
    );
  }
}
