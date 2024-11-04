# Flutter Screenshot Google Street View

Este paquete permite capturar y mostrar imágenes de Google Street View en aplicaciones Flutter.

## Features

- Captura de imágenes de Street View.
- Visualización de imágenes capturadas.
- Personalización de la configuración de captura.

## Getting started

Para comenzar a usar este paquete, asegúrate de tener una clave de API de Google Maps habilitada para el servicio de Street View.

## Usage

Aquí tienes un ejemplo de cómo usar los widgets `StreetViewCapture` y `StreetViewPreview`:

```dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenshot_google_street_view/flutter_screenshot_google_street_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Street View Example')),
        body: StreetViewExample(),
      ),
    );
  }
}

class StreetViewExample extends StatefulWidget {
  @override
  _StreetViewExampleState createState() => _StreetViewExampleState();
}

class _StreetViewExampleState extends State<StreetViewExample> {
  String? _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreetViewCapture(
          initialPosition: LatLng(37.7749, -122.4194), // San Francisco
          config: StreetViewConfig(apiKey: 'YOUR_GOOGLE_MAPS_API_KEY'),
          onImageCaptured: (imageUrl, position) {
            setState(() {
              _imageUrl = imageUrl;
            });
          },
        ),
        if (_imageUrl != null)
          StreetViewPreview(
            imageUrl: _imageUrl!,
            fit: BoxFit.cover,
          ),
      ],
    );
  }
}
```

## Additional information

Para más información sobre cómo contribuir al paquete o reportar problemas, visita el repositorio del proyecto.
