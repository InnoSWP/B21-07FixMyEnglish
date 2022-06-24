import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_svg/flutter_svg.dart';

import 'IntroAppBarWidget.dart';
import '../MainPageForAnalysisInputText/MainMainPageForAnalysisInputTextWidget.dart';
import 'package:web1_app/BACK-END/PDFfileClass.dart';
import '../MainPageForAnalysisMultiplePDFs/MainMainPageForAnalysisPDFsWidget.dart';
import '../../BACK-END/AnalyzePDF/UploadPDF.dart';
import '../../BACK-END/AnalyzePDF/AnalyzePDF.dart';
import '../../BACK-END/AnalyzePDF/SentencePartClass.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class IntroWidget extends StatefulWidget {
  const IntroWidget({Key? key}) : super(key: key);

  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  final controllerOfTextForAnalysis = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerOfTextForAnalysis.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator IntroPage - FRAME

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
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
                  padding: EdgeInsets.only(right: 5),
                  child: Text("iExtract",
                      style: TextStyle(
                        color: Color.fromRGBO(77, 102, 88, 1),
                        fontFamily: 'Eczar',
                        fontSize: 55,
                      )),
                ),
              ),
              Center(
                child: FractionallySizedBox(
                  widthFactor: 60 / 100,
                  child: Column(
                    children: [
                      AnalysisTextField(),
                      analyzeTextButton(),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          "or",
                          style: TextStyle(
                            color: Color.fromRGBO(95, 95, 105, 1),
                            fontFamily: 'Eczar',
                            fontSize: 30,
                          ),
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

  Widget analyzeTextButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: FittedBox(
          child: ElevatedButton(
              onPressed: () async {
                String textFromTextField = controllerOfTextForAnalysis.text;
                if (textFromTextField != '') {

                  // uncomment to unmock
                  /*
                  List<PDFfile>? files = [];
                  files.add(PDFfile('textForAnalysis', textFromTextField));
                  Map<String, List<List<SentencePart>>> mistakes =
                      await Analyzer.getMistakes(files);*/
                  // mocked beginning
                  List <dynamic> files = [];
                  final jsondata = await rootBundle.rootBundle.loadString('../../../assets/json1');
                  files.add(jsondata);
                  Map<String, List<List<SentencePart>>> mistakes = await Analyzer.getMistakes(files);
                  // mocked ending

                  Analyzer.reportData.addAll(mistakes);
                  Navigator.push(navigatorKey.currentContext!,
                      MaterialPageRoute(builder: (context) {
                    return const MainMainPageForAnalysisInputTextWidget();
                  }));
                }
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF4D6658),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Row(
                children: <Widget>[
                  const Text("Analyze text",
                      style: TextStyle(
                        color: Color.fromRGBO(251, 253, 247, 1),
                        fontFamily: 'Eczar',
                        fontSize: 30,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Image.asset(
                      'Zoomall.png',
                      height: 35,
                      width: 35,
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget AnalysisTextField() {
    return Center(
      child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                offset: Offset(1, 3),
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(23)),
          ),
          margin: const EdgeInsets.only(top: 55),
          child: TextField(
              key: const Key("textField"),
              controller: controllerOfTextForAnalysis,
              cursorColor: Color.fromRGBO(134, 73, 33, 1),
              cursorWidth: 2,
              cursorRadius: Radius.circular(3),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(top: 20, right: 27, left: 27, bottom: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(23)),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                hintText: "Input text for analysis",
                fillColor: Color(0xFFF2EEE1),
                filled: true,
              ),
              style: TextStyle(
                  height: 1.5,
                  fontFamily: 'Eczar',
                  fontSize: 20,
                  color: Colors.black),
              maxLines: 9,
              minLines: 1)),
    );
  }

  Widget UploadButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Center(
        child: FittedBox(
          child: ElevatedButton(
              onPressed: () async {

                // uncomment to unmock
                /*
                List<PDFfile>? files = PdfAPI.getFilesTexts(await PdfAPI.selectFiles());
                if (files == null) {
                  print("problem");
                }
                Map<String, List<List<SentencePart>>> mistakes = await Analyzer.getMistakes(files!);*/

                // mocked beginning
                List <dynamic> files = [];
                final jsondata = await rootBundle.rootBundle.loadString('../../../assets/json1');
                files.add(jsondata);
                final jsondata1 = await rootBundle.rootBundle.loadString('../../../assets/json2');
                files.add(jsondata1);
                final jsondata2 = await rootBundle.rootBundle.loadString('../../../assets/json3');
                files.add(jsondata2);
                Map<String, List<List<SentencePart>>> mistakes = await Analyzer.getMistakes(files);
                // mocked ending

                Analyzer.reportData.addAll(mistakes);

                Navigator.push(navigatorKey.currentContext!,
                    MaterialPageRoute(builder: (context) {
                  return const MainMainPageForAnalysisPDFsWidget();
                }));
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(134, 73, 33, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              ),
              child: Row(
                children: <Widget>[
                  const Text("Upload",
                      style: TextStyle(
                        color: Color.fromRGBO(251, 253, 247, 1),
                        fontFamily: 'Eczar',
                        fontSize: 30,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Image.asset(
                      'Importpdficon.png',
                      height: 35,
                      width: 35,
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
