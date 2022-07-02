import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'IntroAppBarWidget.dart';
import '../MainPageForAnalysisInputText/MainMainPageForAnalysisInputTextWidget.dart';
import 'package:web1_app/BACK-END/PDFfileClass.dart';
import '../MainPageForAnalysisMultiplePDFs/MainMainPageForAnalysisPDFsWidget.dart';
import '../../BACK-END/AnalyzePDF/UploadPDF.dart';
import '../../BACK-END/AnalyzePDF/AnalyzePDF.dart';
import '../../BACK-END/AnalyzePDF/SentencePartClass.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: "Fix my English",
        builder: EasyLoading.init(),
        home: IntroWidget());
  }
}

class IntroWidget extends StatefulWidget {
  const IntroWidget({Key? key}) : super(key: key);

  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  final controllerOfTextForAnalysis = TextEditingController();
  late int maxLines;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerOfTextForAnalysis.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator IntroPage - FRAME
    double h = MediaQuery.of(context).size.height;
    maxLines = h~/100;
    return Scaffold(
      appBar: const IntroAppBarWidget(),
      body: Container(
        color: const Color.fromRGBO(251, 253, 247, 1),
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(
              "leftsmallwave.svg",
              height: 175,
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(
              "leftbigwave.svg",
              height: 600,
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              "rightwave.svg",
              height: 600,
              fit: BoxFit.fitWidth,
            ),
          ),
          Center(
            child: FractionallySizedBox(
              widthFactor: 60 / 100,
              child: Column(
                children: [

                  //Spacer(),
                  Container(height: h*0.177,),
                  Center(
                      child: AnalysisTextField()),
                  Expanded(
                    child: Column(
                      children: [
                        analyzeTextButton(),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SizedBox(
                              height: 45,
                              child: Container(
                                child: Text(
                                  "or",
                                  style: TextStyle(
                                    color: Color.fromRGBO(95, 95, 105, 1),
                                    fontFamily: 'Eczar',
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        UploadButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget analyzeTextButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
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
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: FittedBox(
            child: ElevatedButton(
                onPressed: () async {
                  String textFromTextField = controllerOfTextForAnalysis.text;
                  if (textFromTextField != '') {
                    EasyLoading.show(status: 'loading...');
                    List<PDFfile>? files = [];
                    files.add(PDFfile('textForAnalysis', textFromTextField));

                    Map<String, List<List<SentencePart>>>? mistakes =
                        await Analyzer.getMistakes(files);
                    if (mistakes == null) {
                      List<dynamic> files = [];
                      final jsondata = await rootBundle.rootBundle
                          .loadString('../../../assets/json1');
                      files.add(jsondata);
                      mistakes =
                          await Analyzer.getMistakes_mocked(files, false);

                      Analyzer.reportData.addAll(mistakes);
                      controllerOfTextForAnalysis.text = "";
                      EasyLoading.dismiss();
                      Navigator.push(navigatorKey.currentContext!,
                          MaterialPageRoute(builder: (context) {
                        return const MainMainPageForAnalysisInputTextWidget();
                      }));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF4D6658),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
      ),
    );
  }

  Widget AnalysisTextField() {
    return Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 3,
              offset: Offset(1, 3),
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
        margin: const EdgeInsets.only(top: 0),
        child: TextField(
            key: const Key("textField"),
            controller: controllerOfTextForAnalysis,
            cursorColor: Color.fromRGBO(134, 73, 33, 1),
            cursorWidth: 2,
            cursorRadius: Radius.circular(3),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 30, right: 27, left: 27, bottom: 30),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(29)),
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
                height: 1.4,
                fontFamily: 'Eczar',
                fontSize: 23,
                color: Colors.black),
            maxLines: maxLines,
            minLines: maxLines));
  }

  Widget UploadButton() {
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
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: FittedBox(
          child: ElevatedButton(
              onPressed: () async {
                List<PDFfile>? files =
                    PdfAPI.getFilesTexts(await PdfAPI.selectFiles());
                EasyLoading.show(status: 'loading...');
                if (files == null) {
                  print("Problem: no files chosen!");
                  EasyLoading.dismiss();
                }
                Map<String, List<List<SentencePart>>>? mistakes =
                    await Analyzer.getMistakes(files!);

                if (mistakes == null) {
                  List<dynamic> files = [];
                  final jsondata = await rootBundle.rootBundle
                      .loadString('../../../assets/json1');
                  files.add(jsondata);
                  final jsondata1 = await rootBundle.rootBundle
                      .loadString('../../../assets/json2');
                  files.add(jsondata1);
                  final jsondata2 = await rootBundle.rootBundle
                      .loadString('../../../assets/json3');
                  files.add(jsondata2);
                  mistakes = await Analyzer.getMistakes_mocked(files, true);
                }

                Analyzer.reportData.addAll(mistakes);
                Analyzer.reportData["test file0.pdf"]?.forEach((el) {
                  el.forEach((elem) {
                    print(elem.text);
                  });
                });
                EasyLoading.dismiss();
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
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              ),
              child: Row(
                children: <Widget>[
                  const Text("Upload files",
                      style: TextStyle(
                        color: Color.fromRGBO(251, 253, 247, 1),
                        fontFamily: 'Eczar',
                        fontSize: 30,
                      )),
                  Image.asset(
                    'Importpdficon.png',
                    height: 35,
                    width: 35,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
