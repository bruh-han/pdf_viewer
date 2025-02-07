import 'package:flutter/material.dart';
import 'package:pdf_viewer/screen/pdf_viewer_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PdfViewerScreen()),
            );
          },
          child: const Text('Open PDF Viewer'),
        ),
      ),
    );
  }
}
