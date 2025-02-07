// Create a new file: lib/repository/pin_repository.dart
import 'package:pdf_viewer/model/document_pin.dart';

abstract class PinRepository {
  Future<List<DocumentPin>> getPins();
  Future<void> savePin(DocumentPin pin);
  Future<void> deletePin(String id);
}

class InMemoryPinRepository implements PinRepository {
  final List<DocumentPin> _pins = [];

  @override
  Future<List<DocumentPin>> getPins() async => List.unmodifiable(_pins);

  @override
  Future<void> savePin(DocumentPin pin) async {
    _pins.add(pin);
  }

  @override
  Future<void> deletePin(String id) async {
    _pins.removeWhere((pin) => pin.id == id);
  }
}