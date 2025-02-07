// Create a new file: lib/service/pin_service.dart
import 'package:pdf_viewer/model/document_pin.dart';
import 'package:pdf_viewer/repository/pin_repository.dart';

class PinService {
  final PinRepository _repository;

  PinService(this._repository);

  Future<void> addPin({
    required int pageNumber,
    required double normalizedX,
    required double normalizedY,
  }) async {
    final pin = DocumentPin(
      pageNumber: pageNumber,
      normalizedX: normalizedX,
      normalizedY: normalizedY,
    );
    await _repository.savePin(pin);
  }

  Future<List<DocumentPin>> getPins() => _repository.getPins();
  Future<void> removePin(String id) => _repository.deletePin(id);
}