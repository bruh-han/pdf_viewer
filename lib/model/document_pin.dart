// document_pin.dart
import 'package:uuid/uuid.dart';

class DocumentPin {
  final String id;
  final int pageNumber;
  final double normalizedX;
  final double normalizedY;
  final String? description;

  DocumentPin({
    String? id,
    required this.pageNumber,
    required this.normalizedX,
    required this.normalizedY,
    this.description,
  }) : id = id ?? const Uuid().v4();
}