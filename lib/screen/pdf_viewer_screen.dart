// pdf_viewer_screen.dart
import 'package:flutter/material.dart';
import 'package:pdf_viewer/screen/pin_overlay.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:provider/provider.dart';
import 'package:pdf_viewer/provider/pin_provider.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({super.key});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  late PdfViewerController _pdfViewerController;
  int _currentPage = 1;
  Size _pageSize = Size.zero;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              // Toggle pin adding mode
              setState(() {
                // Implement pin mode toggle
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SfPdfViewer.asset(
            'assets/PDF/PPT.pdf',
            controller: _pdfViewerController,
            pageLayoutMode: PdfPageLayoutMode.single,
            onPageChanged: (PdfPageChangedDetails details) {
              setState(() {
                _currentPage = details.newPageNumber;
              });
            },
            onDocumentLoaded: (PdfDocumentLoadedDetails details) {
              setState(() {
                // You might need to adjust this based on how you get the actual page size
                _pageSize = Size(
                    details.document.pages[0].size.width,
                    details.document.pages[0].size.height
                );
              });
            },
          ),
          PinOverlay(
            currentPage: _currentPage,
            pageSize: _pageSize,
            onTapAdd: (normalizedX, normalizedY) {
              context.read<PinProvider>().addPin(
                _currentPage,
                normalizedX,
                normalizedY,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    super.dispose();
  }
}