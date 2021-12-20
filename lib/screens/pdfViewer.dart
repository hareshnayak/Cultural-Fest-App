import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
class PdfViewerPage extends StatelessWidget {
  // const PdfViewerPage({Key key}) : super(key: key);

  final pdf;

  PdfViewerPage({this.pdf});

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => pdf.save(),
    );
  }
}
