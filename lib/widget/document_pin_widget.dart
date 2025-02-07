// document_pin_widget.dart
import 'package:flutter/material.dart';
import 'package:pdf_viewer/model/document_pin.dart';

class SimplePinWidget extends StatelessWidget {
  final DocumentPin pin;
  final bool isSelected;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double size;
  final Color color;

  const SimplePinWidget({
    Key? key,
    required this.pin,
    this.isSelected = false,
    this.onTap,
    this.onLongPress,
    this.size = 24.0,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Tooltip(
        message: pin.description ?? 'Pin ${pin.id}',
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? color.withOpacity(0.3) : Colors.transparent,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: size,
                color: color,
              ),
              if (isSelected)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: size * 0.3,
                    height: size * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: color, width: 2),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}