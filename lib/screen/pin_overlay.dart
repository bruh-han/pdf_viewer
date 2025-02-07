// Create a new file: lib/widgets/pin_overlay.dart
import 'package:flutter/material.dart';
import 'package:pdf_viewer/model/document_pin.dart';
import 'package:pdf_viewer/widget/document_pin_widget.dart';
import 'package:provider/provider.dart';
import 'package:pdf_viewer/provider/pin_provider.dart';

class PinOverlay extends StatelessWidget {
  final int currentPage;
  final Size pageSize;
  final Function(double, double)? onTapAdd;

  const PinOverlay({
    super.key,
    required this.currentPage,
    required this.pageSize,
    this.onTapAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PinProvider>(
      builder: (context, pinProvider, child) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTapUp: onTapAdd != null
              ? (details) {
            final normalizedX = details.localPosition.dx / pageSize.width;
            final normalizedY = details.localPosition.dy / pageSize.height;
            onTapAdd!(normalizedX, normalizedY);
          }
              : null,
          child: Stack(
            children: [
              for (final pin in pinProvider.getPinsForPage(currentPage))
                Positioned(
                  left: pin.normalizedX * pageSize.width,
                  top: pin.normalizedY * pageSize.height,
                  child: SimplePinWidget(
                    pin: pin,
                    isSelected: pin.id == pinProvider.selectedPin?.id,
                    onTap: () => pinProvider.selectPin(pin.id),
                    onLongPress: () {
                      // Show options menu
                      showPinOptionsMenu(context, pin);
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void showPinOptionsMenu(BuildContext context, DocumentPin pin) {
    final pinProvider = context.read<PinProvider>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pin Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete Pin'),
              onTap: () {
                pinProvider.removePin(pin.id);
                Navigator.pop(context);
              },
            ),
            // Add more options here as needed
          ],
        ),
      ),
    );
  }
}