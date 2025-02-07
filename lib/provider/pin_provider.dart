// pin_provider.dart
import 'package:flutter/cupertino.dart';
import 'package:pdf_viewer/model/document_pin.dart';

class PinProvider with ChangeNotifier {
  final List<DocumentPin> _pins = [];
  DocumentPin? _selectedPin;

  List<DocumentPin> get pins => List.unmodifiable(_pins);
  DocumentPin? get selectedPin => _selectedPin;

  List<DocumentPin> getPinsForPage(int pageNumber) {
    return _pins.where((pin) => pin.pageNumber == pageNumber).toList();
  }

  void addPin(int pageNumber, double normalizedX, double normalizedY, {String? description}) {
    final pin = DocumentPin(
      pageNumber: pageNumber,
      normalizedX: normalizedX,
      normalizedY: normalizedY,
      description: description,
    );
    _pins.add(pin);
    notifyListeners();
  }

  void removePin(String id) {
    if (_selectedPin?.id == id) {
      _selectedPin = null;
    }
    _pins.removeWhere((pin) => pin.id == id);
    notifyListeners();
  }

  void selectPin(String id) {
    _selectedPin = _pins.firstWhere((pin) => pin.id == id);
    notifyListeners();
  }

  void clearSelection() {
    _selectedPin = null;
    notifyListeners();
  }
}