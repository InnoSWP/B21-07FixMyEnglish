import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:web1_app/main.dart';
import '../../BACK-END/Exporting/ExportFile.dart';
import '../../BACK-END/PDFfileClass.dart';
import '../FeedbackPage/FeedbackPage.dart';
import 'MainAppBarWidget.dart';
import '../../BACK-END/AnalyzePDF/SentencePartClass.dart';
import '../../BACK-END/AnalyzePDF/AnalyzePDF.dart';
import 'TooltipSpan.dart';

class MainPageForTextAnalysis extends StatelessWidget {
  const MainPageForTextAnalysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Fix my English",
        debugShowCheckedModeBanner: false,
        home: MainMainPageForAnalysisInputTextWidget());
  }
}

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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Boolean isReportSubmitted = new Boolean(false);
  Boolean isReportFormClosed = new Boolean(false);
  String currentMistakeDescription = "";
  late double h;
  late int maxLines;

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
    h = MediaQuery.of(context).size.height;
    maxLines = h ~/50;
    return Scaffold(
      key: scaffoldKey,
      appBar: MainAppBarWidget(context),
      body: Container(
          child: Row(
        children: [
          ReportPartWidget(),
          TextInputPartWidget(),
        ],
      )),
    );
  }

  Widget ReportPartWidget() {
    return Expanded(
        child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 55),
            child: Container(
              child: mistakenSentenceList != null
                  ? Text("Mistaken Sentences",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        fontSize: 27,
                        fontFamily: 'Eczar',
                        color: Color.fromRGBO(134, 73, 33, 1),
                      ))
                  : SizedBox.shrink(),
            ),
          ),
        ),
        MistakenSentenceList(),
        mistakenSentenceList != null
            ? Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                    height: 145,
                    color: Color(0xAAF2EEE1),
                    child: Row(
                      children: [
                        MistakeDescriptionField(),
                        Spacer(),
                        ExportButton(),
                      ],
                    )),
              )
            : SizedBox.shrink()
      ],
    ));
  }

  Widget MistakeDescriptionField() {
    return currentMistakeDescription != ""
        ? Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5, left: 55),
            child: Container(
              width: 600,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Mistake description",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          fontSize: 27,
                          fontFamily: 'Eczar',
                          color: Color.fromRGBO(134, 73, 33, 1),
                        )),
                  ),
                  Container(
                      height: 70,
                      width: 600,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          controller: ScrollController(),
                          scrollDirection: Axis.vertical,
                          child: Text(
                            "${currentMistakeDescription}",
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'Eczar', height: 1.3),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          )
        : SizedBox.shrink();
  }

  Widget MistakenSentenceList() {
    return Expanded(
      child: mistakenSentenceList != null
          ? ListView.builder(
              itemCount: mistakenSentenceList?.length,
              itemBuilder: (BuildContext context, int index) {
                Widget? x = MistakenSentenceElement(
                    mistakenSentenceList![index], index);
                return x != null && mistakenSentenceList![index].isNotEmpty
                    ? x
                    : SizedBox.shrink();
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
                    padding: const EdgeInsets.only(top: 12.0, right: 10),
                    child: Row(
                      children: [
                        Material(
                          color: Colors.white.withOpacity(0.0),
                          child: InkWell(
                              onTap: () async {
                                await Navigator.of(context).push(
                                  PageRouteBuilder(
                                    opaque: false, // set to false
                                    pageBuilder: (_, __, ___) => FeedbackPage(
                                        convertTextToTextSpans(text),
                                        index,
                                        "textForAnalysis",
                                        isReportSubmitted,
                                        isReportFormClosed),
                                  ),
                                );
                                EasyLoading.show(status: "loading...");
                                while (!isReportFormClosed.value &&
                                    !isReportSubmitted.value) {
                                  await new Future.delayed(
                                      new Duration(milliseconds: 500));
                                }
                                EasyLoading.dismiss();
                                const snackBar = SnackBar(
                                  content: Text(
                                      'Thanks for reporting! You answer saved!'),
                                );
                                if (!isReportFormClosed.value)
                                  scaffoldKey.currentState!
                                      .showSnackBar(snackBar);
                              },
                              child: Icon(
                                Icons.warning_rounded,
                                color: Color(0xFFAA6D43),
                                size: 32,
                              )),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Text("Report",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Eczar',
                                color: Color.fromRGBO(134, 73, 33, 1),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Row(
                      children: [
                        Material(
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
                         Padding(
                           padding: const EdgeInsets.only(left: 3.0),
                           child: Text("Copy",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                fontSize: 16,
                                fontFamily: 'Eczar',
                                color: Color.fromRGBO(134, 73, 33, 1),
                              )),
                         ),
                      ],
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
    for (var element in text) {
      toRet += element.text;
    }
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
                  style: const TextStyle(
                    height: 1.5,
                    fontSize: 20,
                    fontFamily: 'Eczar',
                  ))))
          : toRet.add(TooltipSpan(
              message:
                  "On tap, you can see the mistake description at the bottom of the screen",
              inlineSpan: TextSpan(
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        currentMistakeDescription = i.description!;
                      });
                    },
                  text: i.text,
                  style: const TextStyle(
                    backgroundColor: Color(0x80DD4A4A),
                    height: 1.5,
                    fontSize: 20,
                    fontFamily: 'Eczar',
                  ))));
    }
    return toRet;
  }

  Widget ExportButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 0, right: 53),
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
        child: Column( children: [
          TextInputField(),
          Spacer(),
          AnalyzeTextButton()
        ]));
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
          margin: const EdgeInsets.only(top: 65, left: 20, right: 20),
          child: TextField(
              key: Key("textField"),
              controller: controllerOfTextForAnalysis,
              minLines: maxLines,
              maxLines: maxLines,
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
                  color: Colors.black,),
              )),
    );
  }

  Widget AnalyzeTextButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 30),
        child: FittedBox(
          child: ElevatedButton(
              onPressed: () async {
                String textFromTextField = controllerOfTextForAnalysis.text;
                if (textFromTextField != '') {
                  EasyLoading.show(status: "loading...");
                  List<PDFfile>? files = [];
                  files.add(PDFfile('textForAnalysis', textFromTextField));
                  Map<String, List<List<SentencePart>>>? mistakes =
                      await Analyzer.getMistakes(files);
                  if (mistakes == null) {
                    List<dynamic> files = [];
                    final jsondata = await rootBundle.rootBundle
                        .loadString('../../../assets/json1');
                    files.add(jsondata);
                    mistakes = await Analyzer.getMistakes_mocked(files, false);
                  }
                  Analyzer.reportData.addAll(mistakes);
                  setState(() {
                    mistakenSentenceList =
                        Analyzer.reportData["textForAnalysis"];
                  });
                  EasyLoading.dismiss();
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
