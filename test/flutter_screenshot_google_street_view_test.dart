import 'package:flutter_screenshot_google_street_view/flutter_screenshot_google_street_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart'
    as street_view;
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

void main() {
  group('StreetViewConfig', () {
    test('generates correct image URL', () {
      final config = StreetViewConfig(apiKey: 'test_key');
      final position = street_view.LatLng(37.7749, -122.4194);
      final mapsPosition = maps.LatLng(position.latitude, position.longitude);
      final url = config.generateImageUrl(
        position: mapsPosition,
        heading: 90,
        pitch: 0,
      );

      expect(url, contains('https://maps.googleapis.com/maps/api/streetview'));
      expect(url, contains('size=600x300'));
      expect(url, contains('location=37.7749,-122.4194'));
      expect(url, contains('heading=90'));
      expect(url, contains('pitch=0'));
      expect(url, contains('key=test_key'));
    });
  });

  group('StreetViewCapture Widget', () {
    testWidgets('initializes with given position', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: StreetViewCapture(
          initialPosition: street_view.LatLng(37.7749, -122.4194),
          config: StreetViewConfig(apiKey: 'test_key'),
        ),
      ));

      // Verificar que el widget se construye sin errores
      expect(find.byType(StreetViewCapture), findsOneWidget);
    });
  });

  group('StreetViewPreview Widget', () {
    testWidgets('displays image from URL', (WidgetTester tester) async {
      const imageUrl = 'https://example.com/image.jpg';
      await tester.pumpWidget(MaterialApp(
        home: StreetViewPreview(imageUrl: imageUrl),
      ));

      // Verificar que el widget se construye sin errores
      expect(find.byType(StreetViewPreview), findsOneWidget);
    });
  });
}
