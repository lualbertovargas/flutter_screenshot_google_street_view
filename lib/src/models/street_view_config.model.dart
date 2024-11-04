import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

/// Configuration class for Street View capture functionality
class StreetViewConfig {
  /// Google Maps API Key
  final String apiKey;

  /// Width of the captured image
  final int imageWidth;

  /// Height of the captured image
  final int imageHeight;

  const StreetViewConfig({
    required this.apiKey,
    this.imageWidth = 600,
    this.imageHeight = 300,
  });

  /// Generates the Street View static image URL
  String generateImageUrl({
    required LatLng position,
    required double heading,
    required double pitch,
  }) {
    return 'https://maps.googleapis.com/maps/api/streetview'
        '?size=${imageWidth}x$imageHeight'
        '&location=${position.latitude},${position.longitude}'
        '&heading=$heading'
        '&pitch=$pitch'
        '&key=$apiKey';
  }
}
