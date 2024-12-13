import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerController {
  final MobileScannerController controller = MobileScannerController();
  String? scanResult;
  bool isFlashOn = false;

  void toggleFlash() {
    isFlashOn = !isFlashOn;
    controller.toggleTorch();
  }

  void setScanResult(String result) {
    scanResult = result;
  }

  void resetScanResult() {
    scanResult = null;
  }
}
