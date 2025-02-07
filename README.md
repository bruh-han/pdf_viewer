# PDF Viewer with Pin Annotations

## Project Overview
A Flutter application that allows users to view PDFs and add pin annotations at specific locations on PDF pages. The application is designed to work on iOS, Android, and Web platforms.

## Current Features
- PDF viewing using Syncfusion's SfPdfViewer
- Ability to add pins at specific locations on PDF pages
- Pin state management using Provider pattern
- Basic pin UI with selection capability

## Project Structure
```
lib/
├── main.dart                    # Main application entry
├── model/
│   └── document_pin.dart        # Pin data model
├── provider/
│   └── pin_provider.dart        # State management for pins
├── screen/
│   ├── landing_page.dart        # Initial landing screen
│   └── pdf_viewer_screen.dart   # PDF viewer implementation
└── widgets/
    └── document_pin_widget.dart # Pin UI component
```

## Current Implementation
- Using `SfPdfViewer.asset` in single page mode
- Stack layout with `SfPdfViewer` and custom pin overlay
- Pins stored with normalized coordinates (0-1) relative to page dimensions
- Pins rendered using `Positioned` widgets in overlay

## Current Challenge
The main challenge is maintaining pin positions when users interact with the PDF:

- Pins currently remain stationary when users zoom, pan, or scroll the PDF
- Need pins to transform (scale, translate) in sync with PDF content
- Solution needs to work consistently across mobile and web platforms

## Key Files
### `document_pin.dart`
Defines the pin data model with normalized coordinates:
```dart
class DocumentPin {
  final String id;
  final int pageNumber;
  final double normalizedX;
  final double normalizedY;
  // ...
}
```

### `pin_provider.dart`
Manages pin state and operations:
```dart
class PinProvider with ChangeNotifier {
  final List<DocumentPin> _pins = [];
  // Methods for adding, removing, and managing pins
}
```

### `pdf_viewer_screen.dart`
Main PDF viewer implementation with pin overlay:
```dart
class PdfViewerScreen extends StatefulWidget {
  // PDF viewer implementation with Stack layout
  // Current challenge: Syncing pin overlay with PDF transformations
}
```

## Dependencies
- `flutter`
- `provider`
- `syncfusion_flutter_pdfviewer`
- `uuid`

## Environment
- Flutter: [version]
- Dart: [version]
- syncfusion_flutter_pdfviewer: [version]

## Getting Started
1. Clone the repository
2. Run `flutter pub get`
3. Add your PDF file to the assets folder
4. Update the asset path in `pdf_viewer_screen.dart`
5. Run the application

## Looking For Help
Specifically seeking guidance on:
- Accessing viewport/transformation information from `SfPdfViewer`
- Best practices for implementing synchronized overlays
- Handling PDF transformations across different platforms

## Related Resources
Similar issue discussed: Syncfusion Forum Post [https://www.syncfusion.com/forums/181702/translating-screen-coordinates-into-pdf-coordinates]

