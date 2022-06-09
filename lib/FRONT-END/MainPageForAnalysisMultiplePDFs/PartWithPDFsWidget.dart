import 'package:flutter/material.dart';
import 'PDFNamesList.dart';
import 'UploadPDFButton.dart';
import 'PDFElementWidget.dart';
import 'ExportAllButton.dart';

class PartWithPDFsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 386,
      color: const Color(0xFFE9F1E8),
      child: Column(
          children: [UploadPDFButton(),
            PDFNamesList(), ExportAllButton()]),
    );
  }
}
