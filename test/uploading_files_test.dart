import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'dart:typed_data';
import 'package:web1_app/BACK-END/DefaultFileClass.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/UploadPDF.dart';

void main() {
  group('Uploading tests', ()
  {
    List<DefaultFile> files = [];

    testWidgets('Get text from file 1', (WidgetTester tester) async {
      tester.runAsync(() async {
        var file = File('assets/test_file_1.pdf');
        final Uint8List encoded = utf8.encoder.convert(file.readAsStringSync());
        files.add(DefaultFile(encoded, "test_file_1.pdf"));
        expect(PdfAPI.getFilesTexts(files)![0].text,
            "There aren’t any problem with that. I have to use 8 tools to modify this problem. I broke my car, that’s pitty.");
      });
    });

    testWidgets('Get text from file 2', (WidgetTester tester) async {
      tester.runAsync(() async {
        var file = File('assets/test_file_2.pdf');
        final Uint8List encoded = utf8.encoder.convert(file.readAsStringSync());
        files.clear();
        files.add(DefaultFile(encoded, "test_file_2.pdf"));
        expect(PdfAPI.getFilesTexts(files)![0].text, "Hello, I’m in love with Flutter. Bring my tea, please. Be careful: it’s hot.");
      });
    });
  });
}