import 'flutter_usdz_viewer_platform_interface.dart';

class FlutterUsdzViewer {
  Future<String?> getPlatformVersion() {
    return FlutterUsdzViewerPlatform.instance.getPlatformVersion();
  }

  Future<bool> loadUSDZFile(String filePath) {
    return FlutterUsdzViewerPlatform.instance.loadUSDZFile(filePath);
  }

  Future<void> dispose() {
    return FlutterUsdzViewerPlatform.instance.dispose();
  }
}
