import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AnalyzeTextButton.dart';
import 'UploadButton.dart';
import 'IntroAppBarWidget.dart';
import 'AnalysisTextFieldWidget.dart';


class IntroWidget extends StatefulWidget {
  const IntroWidget({Key? key}) : super(key: key);

  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator IntroPage - FRAME

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: const IntroAppBarWidget(),
          body: Container(
            color: const Color.fromRGBO(251, 253, 247, 1),
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset("leftsmallwave.svg"),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SvgPicture.asset("leftbigwave.svg"),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset("rightwave.svg", height: 600),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: Text("iExtract",
                      style: TextStyle(
                          color: Color.fromRGBO(77, 102, 88, 1),
                          fontFamily: 'Eczar',
                          fontSize: 55,
                          fontWeight: FontWeight.normal,
                          height: 1)),
                ),
              ),
              Center(
                child: FractionallySizedBox(
                  widthFactor: 60 / 100,
                  child: Column(
                    children: const [
                      AnalysisTextField(),
                      AnalyzeTextButton(),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "OR",
                          style: TextStyle(
                              color: Color.fromRGBO(95, 95, 105, 1),
                              fontFamily: 'Eczar',
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                      UploadButton(),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

