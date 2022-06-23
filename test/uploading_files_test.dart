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

  var data1 = await rootBundle.load('assets/test_file_1.pdf');
  Uint8List myBytes1 = data1.buffer.asUint8List(data1.offsetInBytes, data1.lengthInBytes);

  var data2 = await rootBundle.load('assets/test_file_2.pdf');
  Uint8List myBytes2 = data2.buffer.asUint8List(data2.offsetInBytes, data2.lengthInBytes);

  group('Uploading tests', ()
  {
    test('Get text from file 1', () async{
      files.add(DefaultFile(myBytes1, "test_file_1.pdf"));
      expect(PdfAPI.getFilesTexts(files)![0].text, "There aren’t any problem with that. I have to use 8 tools to modify this problem. I broke my car, that’s pitty.");
    });
    test('Get text from file 2', () async{
      files.clear();
      files.add(DefaultFile(myBytes2, 'test_file_2.pdf'));
      expect(PdfAPI.getFilesTexts(files)![0].text, "Hello, I’m in love with Flutter. Bring my tea, please. Be careful: it’s hot.");
    });
  });
}