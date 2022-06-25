import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:web1_app/BACK-END/FileOfMistakes.dart';
import '../PDFfileClass.dart';
import 'UploadPDF.dart';
import 'package:flutter/services.dart' as rootBundle;
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

    // print("\n");
    // for (var i = 0; i < z.length; i++){
    //   print("${i} ${z[i]}");
    // }
    // print("${sentenceText} ||| ${mistakeDescrip}");
    // print("\n");

    for (var i = 0; i < z.length; i++){
      if (z[i] != ""){
        result.add(SentencePart(z[i], null));
      }
      if (i != z.length - 1) {
        result.add(SentencePart(mistakeText, mistakeDescrip));
      }
    }
    return result;
  }

  // uncomment this to unmock
  /*
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
  }*/


  //mocked function
  static Future<Map<String, List<List<SentencePart>>>> getMistakes(List<dynamic> files) async{
    // key is a fileName and value contain full text split into
    // sentences
    Map<String, List<List<SentencePart>>> tmp = <String, List<List<SentencePart>>>{};
    int num = 0;
    for (dynamic file in files){
      final list = json.decode(file) as List<dynamic>;
      var fileMistakes = await respondToAPI(list, num);
      List<List<SentencePart>> value = [];

      for (Mistake m in fileMistakes.mistakes){
        value.add(__getSentence(m.sentence, m.wrong_phrase, m.description));
      }
      tmp["test file${num}.pdf"] = value;
      num ++;
    }
    return tmp;
  }
}
