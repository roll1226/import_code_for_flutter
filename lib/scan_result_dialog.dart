import 'package:flutter/material.dart';

class ScanResultDialog extends StatelessWidget {
  final String result;
  final VoidCallback onClose;

  const ScanResultDialog({
    super.key,
    required this.result,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Scan Result'),
      content: Text(result),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onClose();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
