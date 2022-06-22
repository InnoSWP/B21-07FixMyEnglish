import 'dart:async';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../PDFfileClass.dart';

class PdfAPI{
  static Future<List<PlatformFile>?> selectFiles() async {
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: true,
      );
    } catch (err) {
      print("selectFiles: ${err}");
    }
    return result?.files;
  }

  static List<PDFfile>? getFilesTexts(List<PlatformFile>? resultFiles){
    if (resultFiles == null) return null;
    try {
      List<PDFfile> files = [];
      for (var item in resultFiles){
        String name = item.name; // !
        Uint8List? itemBytes = item.bytes;
        final PdfDocument document = PdfDocument(inputBytes: itemBytes);
        final String extracted_text = PdfTextExtractor(document).extractText(); // !
        final _whitespaceRE = RegExp(r"\s+");
        final String formated_text = extracted_text.replaceAll('\r\n', ' ').replaceAll(_whitespaceRE, " ");
        print("Text of file:$formated_text");
        document.dispose();
        var file = PDFfile(name, formated_text);
        files.add(file);
      }
      return files;

    }catch (err){print("selectFiles: ${err}"); return null;}
  }
}