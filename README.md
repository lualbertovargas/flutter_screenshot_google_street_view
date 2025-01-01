# Flutter Screenshot Google Street View

<p align="center">
  <img src="https://i.imgur.com/q7XWtUp.gif" width="150" height="300"/>
</p>

## Important Note

For accurate testing and functionality validation, it is essential to test this package on a physical device rather than an emulator.

This package allows capturing and displaying Google Street View images in Flutter applications.

## Features

- Street View image capture
- Display of captured images
- Customizable capture settings

## Getting started

To start using this package, make sure you have a Google Maps API key enabled for the Street View service.

### Requirements

#### Android
- Minimum SDK: 20
- Required permissions in AndroidManifest.xml:
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```
- API key in AndroidManifest.xml:
```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="API_KEY"/>
```

#### iOS
- Minimum version: 14.0
- Configure API key in AppDelegate.swift:
```swift
GMSServices.provideAPIKey("API_KEY")
```

### API Configuration
1. Get an API key at https://cloud.google.com/maps-platform/
2. Enable Google Maps SDK:
   - Maps SDK for Android
   - Maps SDK for iOS
   - Street View Static API

## Usage

Here's an example of how to use the `StreetViewCapture` and `StreetViewPreview` widgets:

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
          config: StreetViewConfig(apiKey: 'API_KEY'),
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

For more information about contributing to the package or reporting issues, visit the project repository.
