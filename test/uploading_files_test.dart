import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/AnalyzePDF.dart';
import 'package:web1_app/BACK-END/DefaultFileClass.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/SentencePartClass.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/UploadPDF.dart';
import 'package:web1_app/BACK-END/Exporting/ExportFile.dart';
import 'package:test/test.dart';
import 'package:path/path.dart';

Future<void> main() async {
  List<DefaultFile> files = [];
  File file1 = File('assets/test_file_1.pdf');
  File file2 = File('assets/test_file_2.pdf');

  group('Uploading tests', ()
  {
    test('Get text from file 1', () async{
      files.add(DefaultFile(await file1.readAsBytes(), basename(file1.path)));
      expect(PdfAPI.getFilesTexts(files)![0].text, "There aren’t any problem with that. I have to use 8 tools to modify this problem. I broke my car, that’s pitty.");
    });
    test('Get text from file 2', () async{
      files.clear();
      files.add(DefaultFile(await file2.readAsBytes(), basename(file2.path)));
      expect(PdfAPI.getFilesTexts(files)![0].text, "Hello, I’m in love with Flutter. Bring my tea, please. Be careful: it’s hot.");
    });
  });
}