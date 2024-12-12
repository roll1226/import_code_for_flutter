import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'permission_handler.dart';
import 'scanner_overlay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? _scanResult;
  bool _isFlashOn = false;
  final MobileScannerController _scannerController = MobileScannerController();

  @override
  void initState() {
    super.initState();
    requestCameraPermission();
  }

  void _showScanResult(String result) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Scan Result'),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _scanResult = null;
                });
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
        actions: [
          IconButton(
            icon: Icon(_isFlashOn ? Icons.flash_on : Icons.flash_off),
            onPressed: () {
              setState(() {
                _isFlashOn = !_isFlashOn;
              });
              _scannerController.toggleTorch();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: _scannerController,
            fit: BoxFit.cover,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                final rawValue = barcode.rawValue;
                if (rawValue != null && rawValue != _scanResult) {
                  setState(() {
                    _scanResult = rawValue;
                  });
                  _showScanResult(rawValue);
                }
              }
            },
          ),
          const ScannerOverlay(),
        ],
      ),
    );
  }
}
