import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'flutter_usdz_viewer_method_channel.dart';

abstract class FlutterUsdzViewerPlatform extends PlatformInterface {
  FlutterUsdzViewerPlatform() : super(token: _token);

  static final Object _token = Object();
  static FlutterUsdzViewerPlatform _instance = MethodChannelFlutterUsdzViewer();
  static FlutterUsdzViewerPlatform get instance => _instance;

  static set instance(FlutterUsdzViewerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> loadUSDZFile(String filePath) {
    throw UnimplementedError('loadUSDZFile() has not been implemented.');
  }

  Future<void> dispose() {
    throw UnimplementedError('dispose() has not been implemented.');
  }
}
