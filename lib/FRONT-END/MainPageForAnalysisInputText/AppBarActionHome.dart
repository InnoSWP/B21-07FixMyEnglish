import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../BACK-END/AnalyzePDF/AnalyzePDF.dart';

class AppBarActionHome extends StatelessWidget {
  BuildContext contextOfMainPage;

  AppBarActionHome(this.contextOfMainPage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE9F1E8),
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 60,
        child: MaterialButton(
          elevation: 3,
          color: const Color.fromRGBO(242, 238, 225, 1),
          shape: const CircleBorder(),
          onPressed: () {
            Analyzer.reportData.clear();
            Navigator.pop(contextOfMainPage);
          },
          child: const Icon(

            Icons.home_outlined,
            size: 30,
            color: Color.fromRGBO(134, 73, 33, 1),
          ),
        ),
      ),
    );
  }
}

