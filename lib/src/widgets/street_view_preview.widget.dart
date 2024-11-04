import 'package:flutter/material.dart';

/// A widget that displays the captured Street View image
class StreetViewPreview extends StatelessWidget {
  /// URL of the Street View image
  final String imageUrl;

  /// How the image should be inscribed into the space
  final BoxFit fit;

  /// Widget to show while the image is loading
  final Widget? loadingWidget;

  /// Builder for error states
  final Widget Function(
      BuildContext context, Object error, StackTrace? stackTrace)? errorBuilder;

  const StreetViewPreview({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.loadingWidget,
    this.errorBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return loadingWidget ??
            const Center(child: CircularProgressIndicator());
      },
      errorBuilder: errorBuilder ??
          (BuildContext context, Object error, StackTrace? stackTrace) {
            return Center(
              child: Icon(Icons.error, color: Colors.red[300]),
            );
          },
    );
  }
}
