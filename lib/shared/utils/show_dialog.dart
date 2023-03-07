import 'package:flutter/material.dart';

class ShowDialog {
  static Future<void> showGeneralDialog(
    BuildContext context, {
    required String message,
    String? cancelTitleButton,
    String? confirmTitleButton,
    required Function() onCancel,
    required Function() onAction,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Notification',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        titlePadding: const EdgeInsets.only(
            top: 24.0, left: 24.0, bottom: 12.0, right: 0.0),
        contentPadding:
            const EdgeInsets.only(top: 0.0, left: 24.0, right: 24.0),
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: onCancel,
            child: Text(cancelTitleButton ?? 'Cancel',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                )),
          ),
          TextButton(
            onPressed: onAction,
            child: Text(confirmTitleButton ?? 'Authentication',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      ),
    );
  }
}
