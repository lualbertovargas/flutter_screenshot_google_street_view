# Changelog

## [0.0.2] - 2024-12-31
### Changed
- Updated minimum iOS requirement to 14.0 for compatibility with google_maps_flutter_ios
- Added API key configuration for Android and iOS
- Updated documentation with setup instructions for both platforms
- Added required permissions for Android (INTERNET, ACCESS_FINE_LOCATION, ACCESS_COARSE_LOCATION)

## [0.0.1] - 2024-10-10
### Added
- Initial implementation of `flutter_screenshot_google_street_view` package
- Added `StreetViewCapture` and `StreetViewPreview` widgets for capturing and displaying Google Street View images
- Created `StreetViewConfig` class for configuring Street View image capture
- Added usage example to `README.md`
- Unit tests to verify widget functionality and image URL generation

### Fixed
- Resolved dependency conflicts between `google_maps_flutter` and `flutter_google_street_view`
- Fixed type conflicts between `LatLng` definitions

### Changed
- Adjusted `pubspec.yaml` to include necessary testing dependencies
