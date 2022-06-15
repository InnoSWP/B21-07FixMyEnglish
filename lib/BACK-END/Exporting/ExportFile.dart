import 'dart:convert';
import 'package:web1_app/BACK-END/AnalyzePDF/AnalyzePDF.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/SentencePartClass.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:html';

void exportFile(String file_name){
  List<List<dynamic>> rows = [];

  List<dynamic> rowHeader = ["Name", "Surname"];
  rowHeader.add("Sentence");
  rowHeader.add("Mistake");
  rowHeader.add("Description");
  rows.add(rowHeader);

  final List<List<SentencePart>>? report = Analyzer.reportData[file_name];
  List<dynamic> row = [];

  for (int i = 0; i < report!.length; i++){
    row = [];
    String sentence = "";
    String mistake = "";
    String description = "";
    for(int j = 0; j < report[i].length; j++){
      sentence += report[i][j].text;
      if(report[i][j].description != null){
        mistake = report[i][j].text;
        description = report[i][j].description!;
      }
    }
    row.add(sentence);
    row.add(mistake);
    row.add(description);
    rows.add(row);
  }
  String csv = const ListToCsvConverter().convert(rows);

  String download_file_name = file_name.split('.pdf')[0] + ".csv";
  new AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
    ..setAttribute("download", download_file_name)
    ..click();
  print("Saved!");
}