import 'package:permission_handler/permission_handler.dart';

Future<void> requestCameraPermission() async {
  final status = await Permission.camera.request();
  if (status.isGranted) {
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}
