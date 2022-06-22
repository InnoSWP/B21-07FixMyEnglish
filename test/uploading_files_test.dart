import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/AnalyzePDF.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/SentencePartClass.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/UploadPDF.dart';
import 'package:web1_app/BACK-END/Exporting/ExportFile.dart';
import 'package:test/test.dart';

Future<void> main() async {

  PlatformFile file_1 = File('assets/test_file_1.pdf') as PlatformFile;
  group('Uploading tests', ()
  {
    test('Get text from file 1', () {
      List<PlatformFile> files = [];
      files.add(file_1);
      expect(PdfAPI.getFilesTexts(files), "matcher");
    });
    test('Get text from file 2', () {
      //List<PlatformFile> files = [];
      //files.add(file_2);
      expect(PdfAPI.getFilesTexts(result?.files), "matcher");
    });
  });
}