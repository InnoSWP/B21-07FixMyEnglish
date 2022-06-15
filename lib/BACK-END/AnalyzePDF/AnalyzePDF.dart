import 'dart:async';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:web1_app/BACK-END/FileOfMistakes.dart';
import '../PDFfileClass.dart';
import 'UploadPDF.dart';
import '../MistakeClass.dart';
import 'SentencePartClass.dart';
import 'RespondToAPI.dart';

class Analyzer{
  static Map<String, List<List<SentencePart>>> reportData = <String, List<List<SentencePart>>>{};
  static List<SentencePart> __getSentence(String sentenceText, String mistakeText, String mistakeDescrip){
    List<SentencePart> result = [];
    var z = sentenceText.split(mistakeText);
    if (mistakeText == ""){
      return [SentencePart(sentenceText, mistakeDescrip)];
    }
    if (z.length != 2){
      return [];
    }
    if (z[0] == '') {
      result.add(SentencePart(mistakeText, mistakeDescrip));
      if (z[1] != ''){
        result.add(SentencePart(z[1], null));
      }
    }else if (z[1] == '') {
      result.add(SentencePart(z[0], null));
      result.add(SentencePart(mistakeText, mistakeDescrip));
    }
    else {
      result.add(SentencePart(z[0], null));
      result.add(SentencePart(mistakeText, mistakeDescrip));
      result.add(SentencePart(z[1], null));
    }
    return result;
  }

  static Future<Map<String, List<List<SentencePart>>>> getMistakes(List<PDFfile> files) async{
    // key is a fileName and value contain full text split into
    // sentences
    Map<String, List<List<SentencePart>>> tmp = <String, List<List<SentencePart>>>{};
    for (PDFfile file in files){
      var fileMistakes = await respondToAPI(file);
      List<List<SentencePart>> value = [];

      for (Mistake m in fileMistakes.mistakes){
        value.add(__getSentence(m.sentence, m.wrong_phrase, m.description));
      }
      tmp[file.name] = value;
    }
    return tmp;
  }
}
