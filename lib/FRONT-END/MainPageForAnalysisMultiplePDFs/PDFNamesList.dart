import 'package:flutter/material.dart';
import 'PDFElementWidget.dart';

class PDFNamesList extends StatefulWidget {
  const PDFNamesList({Key? key}) : super(key: key);

  @override
  State<PDFNamesList> createState() => _PDFNamesListState();
}

class _PDFNamesListState extends State<PDFNamesList> {
  List<String> PDFnames = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          children: _getListData(),
      ),
    );
  }

  _getListData() {
    List<Widget> widgets = [];
    for (var element in PDFnames) {
      widgets.add(PDFElementWidget(element));
    }
    return widgets;
  }
}
