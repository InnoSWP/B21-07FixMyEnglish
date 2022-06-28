import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/services.dart';
import '../../BACK-END/Exporting/ExportFile.dart';
import '../../BACK-END/PDFfileClass.dart';
import '../FeedbackPage/FeedbackPage.dart';
import 'MainAppBarWidget.dart';
import '../../BACK-END/AnalyzePDF/SentencePartClass.dart';
import '../../BACK-END/AnalyzePDF/AnalyzePDF.dart';
import 'TooltipSpan.dart';

class MainMainPageForAnalysisInputTextWidget extends StatefulWidget {
  const MainMainPageForAnalysisInputTextWidget({Key? key}) : super(key: key);

  @override
  _MainMainPageForAnalysisInputTextWidget createState() =>
      _MainMainPageForAnalysisInputTextWidget();
}

class _MainMainPageForAnalysisInputTextWidget
    extends State<MainMainPageForAnalysisInputTextWidget> {
  List<List<SentencePart>>? mistakenSentenceList;
  final controllerOfTextForAnalysis = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerOfTextForAnalysis.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    mistakenSentenceList = Analyzer.reportData["textForAnalysis"];
    controllerOfTextForAnalysis.text = convertToText(mistakenSentenceList);
    print(controllerOfTextForAnalysis.text);
  }

  String convertToText(List<List<SentencePart>>? mistakenSentenceList) {
    String toRet = '';
    mistakenSentenceList?.forEach((el) {
      el.forEach((elem) {
        toRet += elem.text;
      });
    });
    return toRet;
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator IntroPage - FRAME
    return MaterialApp(
      title: "Fix my English",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MainAppBarWidget(context),
        body: Container(
            child: Row(
          children: [
            Expanded(child: ReportPartWidget()),
            TextInputPartWidget(),
          ],
        )),
      ),
    );
  }

  Widget ReportPartWidget() {
    return Column(
      children: [
        Container(
          height: 35,
        ),
        MistakenSentenceList(),
        ExportButton()
      ],
    );
  }

  Widget MistakenSentenceList() {
    return Expanded(
      child: mistakenSentenceList != null
          ? ListView.builder(
          itemCount: mistakenSentenceList?.length,
          itemBuilder: (BuildContext context, int index) {
            Widget? x = MistakenSentenceElement(
                mistakenSentenceList![index], index);
            return x != null && mistakenSentenceList![index].isNotEmpty ? x : SizedBox.shrink();
          })
          : Text("Please, input text and click on button \"Analyze text\""),
    );
  }
  Widget? MistakenSentenceElement(text, index) {
    if (prepareForCopying(text) == "") {
      return null;
    }
    return Container(
        decoration: const BoxDecoration(
          color: const Color(0xFFF2EEE1),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black26,
          //     blurRadius: 3,
          //     offset: Offset(1, 3),
          //     spreadRadius: 1,
          //   ),
          // ],
          borderRadius: BorderRadius.all(Radius.circular(23)),
        ),
        margin: const EdgeInsets.only(top: 15, right: 55, left: 55),
        padding: const EdgeInsets.only(top: 25, right: 35, left: 35, bottom: 3),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: RichText(
                text: TextSpan(
                  text: '',
                  children: convertTextToTextSpans(text),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FittedBox(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0, right: 10),
                    child: Material(
                        color: Colors.white.withOpacity(0.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  opaque: false, // set to false
                                  pageBuilder: (_, __, ___) => FeedbackPage(
                                      convertTextToTextSpans(text),
                                      index,
                                      "textForAnalysis"),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.warning_rounded,
                              color: Color(0xDD864921),
                              size: 32,
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Tooltip(
                      message: "Copy",
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.all(10),
                      showDuration: Duration(seconds: 0),
                      decoration: BoxDecoration(
                        color: Color(0xFF49454F),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                      ),
                      textStyle: TextStyle(color: Colors.white),
                      preferBelow: true,
                      child: Material(
                          color: Colors.white.withOpacity(0.0),
                          child: InkWell(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: prepareForCopying(text)));
                              },
                              child: Image.asset(
                                "copy.png",
                                width: 30,
                                height: 30,
                              ))),
                    ),
                  )
                ]),
              ),
            )
          ],
        ));
  }

  String prepareForCopying(List<SentencePart> text) {
    String toRet = '';
    text.forEach((element) {
      toRet += element.text;
    });
    return toRet;
  }

  List<TooltipSpan> convertTextToTextSpans(List<SentencePart> txt) {
    List<TooltipSpan> toRet = [];
    for (var i in txt) {
      i.description == null
          ? toRet.add(TooltipSpan(
              message: "",
              inlineSpan: TextSpan(
                  text: i.text,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18,
                    fontFamily: 'Eczar',
                  ))))
          : toRet.add(TooltipSpan(
              message: i.description!,
              inlineSpan: TextSpan(
                  text: i.text,
                  style: TextStyle(
                    backgroundColor: Color(0x80DD4A4A),
                    height: 1.5,
                    fontSize: 18,
                    fontFamily: 'Eczar',
                  ))));
    }
    return toRet;
  }

  Widget ExportButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 18, right: 53),
        child: FittedBox(
          child: ElevatedButton(
              onPressed: () {
                print("Exporting file..");
                String selected_file_name = "textForAnalysis";
                print("Selected file name = " + selected_file_name);
                Exporter.downloadFile(
                    Exporter.getCsv(selected_file_name), selected_file_name);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(134, 73, 33, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
              ),
              child: Row(
                children: <Widget>[
                  const Text("Export to CSV",
                      style: TextStyle(
                        color: Color.fromRGBO(251, 253, 247, 1),
                        fontFamily: 'Eczar',
                        fontSize: 30,
                      )),
                ],
              )),
        ),
      ),
    );
  }

  Widget TextInputPartWidget() {
    return Container(
        width: 470,
        color: const Color(0xFFE9F1E8),
        child: Column(children: [TextInputField(), AnalyzeTextButton()]));
  }

  Widget TextInputField() {
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
          margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: TextField(
              key: Key("textField"),
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
              maxLines: 16,
              minLines: 16)),
    );
  }

  Widget AnalyzeTextButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: FittedBox(
          child: ElevatedButton(
              onPressed: () async {
                bool success = true;
                String textFromTextField = controllerOfTextForAnalysis.text;
                if (textFromTextField != '') {
                  List<PDFfile>? files = [];
                  files.add(PDFfile('textForAnalysis', textFromTextField));
                  Map<String, List<List<SentencePart>>>? mistakes =
                      await Analyzer.getMistakes(files);
                  if(mistakes == null) {
                    success = false;
                    List <dynamic> files = [];
                    final jsondata = await rootBundle.rootBundle.loadString(
                        '../../../assets/json1');
                    files.add(jsondata);
                    mistakes = await Analyzer.getMistakes_mocked(files);
                  }
                  Analyzer.reportData.addAll(mistakes);
                  setState(() {
                    if (success)
                      mistakenSentenceList = Analyzer.reportData["textForAnalysis"];
                    else
                      mistakenSentenceList = Analyzer.reportData["12345678901234567890 FIle0.pdf"];
                  });
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
}
