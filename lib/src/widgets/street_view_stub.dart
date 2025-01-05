import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import '../models/street_view_config.model.dart';

class StreetViewCapture extends StatelessWidget {
  final dynamic initialPosition;
  final StreetViewConfig config;
  final void Function(String imageUrl, maps.LatLng position)? onImageCaptured;
  final Widget? customCaptureButton;
  final double initialBearing;
  final bool zoomGesturesEnabled;
  final double height;

  const StreetViewCapture({
    super.key,
    required this.initialPosition,
    required this.config,
    this.onImageCaptured,
    this.customCaptureButton,
    this.initialBearing = 30,
    this.zoomGesturesEnabled = false,
    this.height = 400,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Street View not supported on this platform'));
  }
}

class FlutterGoogleStreetView extends StatelessWidget {
  final dynamic initPos;
  final dynamic initSource;
  final double initBearing;
  final bool zoomGesturesEnabled;
  final Function(dynamic)? onStreetViewCreated;

  const FlutterGoogleStreetView({
    super.key,
    this.initPos,
    this.initSource,
    this.initBearing = 0,
    this.zoomGesturesEnabled = false,
    this.onStreetViewCreated,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Street View not supported on this platform'));
  }
}
