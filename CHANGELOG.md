# Changelog

## [0.0.2] - 2024-12-31
### Changed
- Actualizado requisito mínimo de iOS a 14.0 para compatibilidad con google_maps_flutter_ios
- Agregada configuración de API key para Android y iOS
- Documentación actualizada con instrucciones de configuración para ambas plataformas
- Agregados permisos requeridos para Android (INTERNET, ACCESS_FINE_LOCATION, ACCESS_COARSE_LOCATION)

## [0.0.1] - 2024-10-10
### Added
- Implementación inicial del paquete `flutter_screenshot_google_street_view`.
- Añadidos los widgets `StreetViewCapture` y `StreetViewPreview` para capturar y mostrar imágenes de Google Street View.
- Creación de la clase `StreetViewConfig` para configurar la captura de imágenes de Street View.
- Ejemplo de uso añadido al `README.md`.
- Pruebas unitarias para verificar la funcionalidad de los widgets y la generación de URLs de imagen.

### Fixed
- Resolución de conflictos de dependencias entre `google_maps_flutter` y `flutter_google_street_view`.
- Corrección de conflictos de tipos entre las definiciones de `LatLng`.

### Changed
- Ajustes en el archivo `pubspec.yaml` para incluir las dependencias necesarias para las pruebas.
