import 'dart:async';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'PDFfileClass.dart';

class PdfAPI{
  static Future<List<PDFfile>?> selectFiles() async {
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: true,
      );
    }catch (err) {print("selectFiles: ${err}");}

    if (result == null) return null;
    try {
      List<PDFfile> files = [];
      for (var item in result.files){
        String name = item.name; // !
        Uint8List? itemBytes = item.bytes;
        final PdfDocument document = PdfDocument(inputBytes: itemBytes);
        String text = PdfTextExtractor(document).extractText(); // !
        document.dispose();

        var file = PDFfile(name, text);
        files.add(file);
      }
      return files;

    }catch (err){print("selectFiles: ${err}");}
  }
}