import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'flutter_usdz_viewer_platform_interface.dart';

class MethodChannelFlutterUsdzViewer extends FlutterUsdzViewerPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_usdz_viewer');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> loadUSDZFile(String filePath) async {
    final result = await methodChannel.invokeMethod<bool>('loadUSDZFile', {
      'filePath': filePath,
    });
    return result ?? false;
  }

  @override
  Future<void> dispose() async {
    await methodChannel.invokeMethod<void>('dispose');
  }
}
