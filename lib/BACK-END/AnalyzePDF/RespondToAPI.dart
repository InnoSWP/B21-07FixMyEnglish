import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/FileOfMistakes.dart';
import '../AnalyzePDF/MistakeClass.dart';
import '../AnalyzePDF/PDFfileClass.dart';

Future<FileOfMistakes> respondToAPI(PDFfile inputFile) async {
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
    mistakeList.add(Mistake("Server Error", "Server Error", "Server Error", "Server Error"));
  }
  return FileOfMistakes(inputFile.name, mistakeList);
}