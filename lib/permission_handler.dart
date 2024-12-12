import 'package:permission_handler/permission_handler.dart';

Future<void> requestCameraPermission() async {
  final status = await Permission.camera.request();
  if (status.isGranted) {
    // カメラ使用許可が取得できた場合の処理
  } else if (status.isPermanentlyDenied) {
    // カメラ使用許可が永久に拒否された場合の処理
    openAppSettings();
  }
}
