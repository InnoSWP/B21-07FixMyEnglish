import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:web1_app/BACK-END/FileOfMistakes.dart';
import '../MistakeClass.dart';
import '../PDFfileClass.dart';

Future<FileOfMistakes?> respondToAPI(PDFfile inputFile) async {
  List<Mistake> mistakeList = [];

  print("Connecting to API...");
  print("Checking text:");
  print(inputFile.text);

  final response =
      await http.post(Uri.parse('https://cors-anywhere.herokuapp.com/https://aqueous-anchorage-93443.herokuapp.com/FixMyEnglish'),
          headers: {
            "accept": "application/json",
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*"
          },
          body: jsonEncode({
            "text": inputFile.text
          }));

  print(response.body);

  if (response.statusCode == 200) {
    print("Successful connection");
    final body = json.decode(response.body) as List;
    body.forEach((json) {
      mistakeList.add(Mistake.fromJson(json));
    });
  }
  else{
    print("Unsuccessful connection. Code: " + response.statusCode.toString());
    return null;
  }
  return FileOfMistakes(inputFile.name, mistakeList);
}

// mocked function if can't connect to API
Future<FileOfMistakes> respondToAPI_mocked(List<dynamic> inputFile, int num) async {
  List<Mistake> mistakeList = [];
    print("Mocked connection");
    final body = inputFile;
    body.forEach((json) {
      mistakeList.add(Mistake.fromJson(json));
    });

  return FileOfMistakes("test file${num}.pdf", mistakeList);
}