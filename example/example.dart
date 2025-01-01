import 'package:flutter/material.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart';
import 'package:flutter_screenshot_google_street_view/flutter_screenshot_google_street_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StreetViewScreen()),
            );
          },
          child: Text(
            'Ver Street View',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class StreetViewScreen extends StatefulWidget {
  @override
  _StreetViewScreenState createState() => _StreetViewScreenState();
}

class _StreetViewScreenState extends State<StreetViewScreen> {
  String? _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Street View Example'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: StreetViewCapture(
              initialPosition: LatLng(37.7749, -122.4194), // San Francisco
              config: StreetViewConfig(apiKey: 'API_KEY'),
              onImageCaptured: (imageUrl, position) {
                setState(() {
                  _imageUrl = imageUrl;
                });
              },
            ),
          ),
          if (_imageUrl != null)
            Expanded(
              child: StreetViewPreview(
                imageUrl: _imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
