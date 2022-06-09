import 'package:flutter/material.dart';
import 'MistakenSentenceList.dart';
import 'ExportButton.dart';

class ReportPartWidget extends StatelessWidget {
  ReportPartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [Container(height: 65,), MistakenSentenceList(), ExportButton()],
    ));
  }
}
