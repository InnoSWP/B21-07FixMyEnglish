import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web1_app/FRONT-END/MainPageForAnalysisInputText/TooltipSpan.dart';

class FeedbackPage extends StatefulWidget {
  int indexOfSentenceInPDFFile;
  String PDFname;
  List<TooltipSpan> TextSpans;

  FeedbackPage(List<TooltipSpan> this.TextSpans, this.indexOfSentenceInPDFFile,
      this.PDFname,
      {Key? key})
      : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState(TextSpans);
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  final controllerOfTextForAnalysis = TextEditingController();
  List<TooltipSpan> textSpans;

  _FeedbackPageState(this.textSpans);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerOfTextForAnalysis.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fix my English",
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(190, 200, 200, 200),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Container(
            width: 700,
            height: 600,
            decoration: const BoxDecoration(
              color: Color(0xFFF2EEE1),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: [
                closeButton(),
                header(),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Problem sentence",
                        style: TextStyle(
                            height: 1.45,
                            fontFamily: 'Eczar',
                            fontSize: 23,
                            color: Colors.black),
                      )),
                ),
                mistakenSentence(),
                textFieldForFillingOutReport(),
                submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
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
                String textOfReport = controllerOfTextForAnalysis.text;
                //...
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(134, 73, 33, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              ),
              child: Text("Submit report",
                  style: TextStyle(
                    color: Color.fromRGBO(251, 253, 247, 1),
                    fontFamily: 'Eczar',
                    fontSize: 28,
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget mistakenSentence() {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 8, bottom: 8, left: 8),
      child: Container(
          width: 630,
          height: 120,
          decoration: const BoxDecoration(
            color: Color(0xFFFBFDF7),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Expanded(
              child: SingleChildScrollView(
                child: RichText(
                  text: TextSpan(
                    text: '',
                    children: textSpans,
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Widget textFieldForFillingOutReport() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 35, right: 35, bottom: 20),
      child: TextField(
          controller: controllerOfTextForAnalysis,
          cursorColor: Color.fromRGBO(134, 73, 33, 1),
          cursorWidth: 2,
          cursorRadius: Radius.circular(3),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            hintText: "What is wrong with the sentence?",
            fillColor: Color(0xFFFBFDF7),
            filled: true,
          ),
          style: TextStyle(
              height: 1.45,
              fontFamily: 'Eczar',
              fontSize: 20,
              color: Colors.black),
          maxLines: 7,
          minLines: 7),
    );
  }

  Widget header() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            color: Color(0xFFF2EEE1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 5),
                  child: Icon(
                    Icons.warning_rounded,
                    color: Color(0xDD864921),
                    size: 35,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text("Report form    ",
                      style: TextStyle(
                          height: 1.45,
                          fontFamily: 'Eczar',
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF7A370B))),
                ),
                Spacer()
              ],
            )));
  }

  Widget closeButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10),
      child: Container(
        height: 32,
        child: Align(
          alignment: Alignment.topRight,
          child: Material(
              color: Colors.white.withOpacity(0.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.clear_rounded,
                    size: 32,
                    color: Color(0xFF7A370B),
                  ))),
        ),
      ),
    );
  }
}
