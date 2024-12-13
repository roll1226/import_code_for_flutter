import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'scanner_controller.dart';

class MobileScannerWidget extends StatelessWidget {
  final ScannerController scannerController;
  final ValueChanged<String> onDetect;

  const MobileScannerWidget({
    super.key,
    required this.scannerController,
    required this.onDetect,
  });

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: scannerController.controller,
      fit: BoxFit.cover,
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        for (final barcode in barcodes) {
          final rawValue = barcode.rawValue;
          if (rawValue != null && rawValue != scannerController.scanResult) {
            scannerController.setScanResult(rawValue);
            onDetect(rawValue);
          }
        }
      },
    );
  }
}
