import 'package:flutter/material.dart';
import '../models/street_view_config.model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:flutter_google_street_view/flutter_google_street_view.dart' as street_view;

/// A widget that displays Street View and allows capturing screenshots
class StreetViewCapture extends StatefulWidget {
  /// Initial position for Street View
  final street_view.LatLng initialPosition;

  /// Configuration for Street View
  final StreetViewConfig config;

  /// Callback when an image is captured
  final void Function(String imageUrl, maps.LatLng position)? onImageCaptured;

  /// Custom capture button widget
  final Widget? customCaptureButton;

  /// Initial bearing (camera direction)
  final double initialBearing;

  /// Enable/disable zoom gestures
  final bool zoomGesturesEnabled;

  const StreetViewCapture({
    Key? key,
    required this.initialPosition,
    required this.config,
    this.onImageCaptured,
    this.customCaptureButton,
    this.initialBearing = 30,
    this.zoomGesturesEnabled = false,
  }) : super(key: key);

  @override
  _StreetViewCaptureState createState() => _StreetViewCaptureState();
}

class _StreetViewCaptureState extends State<StreetViewCapture> {
  late street_view.StreetViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: street_view.FlutterGoogleStreetView(
            initPos: widget.initialPosition,
            initSource: street_view.StreetViewSource.outdoor,
            initBearing: widget.initialBearing,
            zoomGesturesEnabled: widget.zoomGesturesEnabled,
            onStreetViewCreated: (controller) {
              _controller = controller;
            },
          ),
        ),
        widget.customCaptureButton ?? _defaultCaptureButton(),
      ],
    );
  }

  Widget _defaultCaptureButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: _captureStreetViewImage,
        child: const Text('Capture Image'),
      ),
    );
  }

  Future<void> _captureStreetViewImage() async {
    try {
      final panoramaCamera = await _controller.getPanoramaCamera();
      final heading = panoramaCamera.bearing ?? 0.0;
      final pitch = panoramaCamera.tilt ?? 0.0;

      final panoramaLocation = await _controller.getLocation();
      final position = panoramaLocation?.position;

      if (position != null) {
        // Convertir de street_view.LatLng a maps.LatLng
        final mapsPosition = maps.LatLng(
          position.latitude,
          position.longitude,
        );

        final imageUrl = widget.config.generateImageUrl(
          position: mapsPosition,
          heading: heading,
          pitch: pitch,
        );

        widget.onImageCaptured?.call(imageUrl, mapsPosition);
      }
    } catch (e) {
      debugPrint('Error capturing Street View image: $e');
    }
  }
}