import 'package:flutter/material.dart';

class AuthenticationStatusWidget extends StatelessWidget {
  final Function() onBack;
  const AuthenticationStatusWidget({Key? key, required this.onBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(),
          const Center(
            child: Text(
              'Success',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Your store registration has been successful.',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'We need to have a second look at all the information we have available during the current process.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          MaterialButton(
            onPressed: onBack,
            color: Colors.blue,
            child: const Text(
              'Back to login screen',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
