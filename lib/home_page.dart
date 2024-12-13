import 'package:flutter/material.dart';

import 'mobile_scanner_widget.dart';
import 'permission_handler.dart';
import 'scan_result_dialog.dart';
import 'scanner_controller.dart';
import 'scanner_overlay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ScannerController _scannerController = ScannerController();

  @override
  void initState() {
    super.initState();
    requestCameraPermission();
  }

  void _onScanResult(String result) {
    showDialog(
      context: context,
      builder: (context) => ScanResultDialog(
        result: result,
        onClose: () => setState(() {
          _scannerController.resetScanResult();
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
        actions: [
          IconButton(
            icon: Icon(
              _scannerController.isFlashOn ? Icons.flash_on : Icons.flash_off,
            ),
            onPressed: () => setState(_scannerController.toggleFlash),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScannerWidget(
            scannerController: _scannerController,
            onDetect: _onScanResult,
          ),
          const ScannerOverlay(),
        ],
      ),
    );
  }
}
