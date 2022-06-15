import 'package:flutter/material.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/SentencePartClass.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/AnalyzePDF.dart';
import '../../BACK-END/AnalyzePDF/UploadPDF.dart';
import '../../BACK-END/AnalyzePDF/AnalyzePDF.dart';
import '../../BACK-END/AnalyzePDF/SentencePartClass.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/PDFfileClass.dart';
import 'MainAppBarWidget.dart';
import 'package:flutter/services.dart';

// Methods:
// ExportAllButton
// ExportButton
// MistakenSentenceElement
// MistakenSentenceList
// PartWithPDFsWidget
// PDFElementWidget
// PDFNamesList
// ReportPartWidget
// UploadPDFButton

class MainMainPageForAnalysisPDFsWidget extends StatefulWidget {
  const MainMainPageForAnalysisPDFsWidget({Key? key}) : super(key: key);

  @override
  _MainMainPageForAnalysisPDFsWidget createState() =>
      _MainMainPageForAnalysisPDFsWidget();
}

class _MainMainPageForAnalysisPDFsWidget
    extends State<MainMainPageForAnalysisPDFsWidget> {
  List<List<SentencePart>>? mistakenSentenceList;
  late int indexOfSelectedPDF;

  @override
  void initState() {
    super.initState();
    mistakenSentenceList = Analyzer.reportData[Analyzer.reportData.keys.first];
    indexOfSelectedPDF = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MainAppBarWidget(context),
        body: Container(
            child: Row(
          children: [
            ReportPartWidget(),
            PartWithPDFsWidget(),
          ],
        )),
      ),
    );
  }

  Widget ReportPartWidget() {
    return Expanded(
        child: Column(
      children: [
        Container(
          height: 65,
        ),
        MistakenSentenceList(),
        ExportButton()
      ],
    ));
  }

  Widget MistakenSentenceList() {
    return Expanded(
      child: mistakenSentenceList!= null ? ListView.builder(
          itemCount: mistakenSentenceList?.length,
          itemBuilder: (BuildContext context, int index) {
            return MistakenSentenceElement(mistakenSentenceList![index]);
          }) : Text("Please, click on upload or any button with name of file on right panel"),
    );
  }

  Widget MistakenSentenceElement(text) {
    return Container(
        decoration: const BoxDecoration(
          color: const Color(0xFFF2EEE1),
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
        margin: const EdgeInsets.only(top: 15, right: 30, left: 30),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: '',
                children: convertTextToTextSpans(text),
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
                            onTap: () {},
                            child: Icon(
                              Icons.warning_outlined,
                              color: Color.fromRGBO(134, 73, 33, 1),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: Material(
                        color: Colors.white.withOpacity(0.0),
                        child: InkWell(
                            onTap: () {
                              Clipboard.setData(
                                  ClipboardData(text: prepareForCopying(text)));
                            },
                            child: Icon(
                              Icons.copy,
                              color: Color.fromRGBO(134, 73, 33, 1),
                            ))),
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

  List<TextSpan> convertTextToTextSpans(List<SentencePart> txt) {
    List<TextSpan> toRet = [];
    for (var i in txt) {
      toRet.add(TextSpan(
          text: i.text,
          style: i.description == null
              ? TextStyle(
                  height: 1.5,
                  fontSize: 18,
                  fontFamily: 'Eczar',
                )
              : TextStyle(
                  backgroundColor: Colors.redAccent,
                  height: 1.5,
                  fontSize: 18,
                  fontFamily: 'Eczar',
                )));
    }
    return toRet;
  }

  Widget ExportButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 10, right: 30),
        child: FittedBox(
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(134, 73, 33, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              ),
              child: Row(
                children: <Widget>[
                  const Text("Export",
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

  Widget PartWithPDFsWidget() {
    return Container(
      width: 386,
      color: const Color(0xFFE9F1E8),
      child: Column(
          children: [UploadPDFButton(), PDFNamesList(), ExportAllButton()]),
    );
  }

  Widget ExportAllButton() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 10),
        child: FittedBox(
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF4D6658),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
              ),
              child: Row(
                children: <Widget>[
                  const Text("Export all",
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
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget PDFNamesList() {
    return Expanded(
        child: ListView.builder(
            itemCount: Analyzer.reportData.length,
            itemBuilder: (BuildContext context, int index) => Visibility(
                visible: Analyzer.reportData.keys.elementAt(index) !=
                    "textForAnalysis",
                child: PDFElementWidget(
                    Analyzer.reportData.keys.elementAt(index),
                    index == indexOfSelectedPDF,
                    index))));
  }

  Widget PDFElementWidget(String PDFName, bool selected, int index) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                mistakenSentenceList = Analyzer.reportData[PDFName];
                indexOfSelectedPDF = index;
              });
            },
            style: ElevatedButton.styleFrom(
              primary:
                  !selected ? const Color(0xFF62806F) : const Color(0xFF4D6658),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.only(
                  top: 10, bottom: 30, right: 5, left: 10),
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: FittedBox(
                        child: Material(
                            color: Colors.white.withOpacity(0.0),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    Analyzer.reportData.remove(PDFName);
                                    if(selected){
                                      indexOfSelectedPDF = -1;
                                      mistakenSentenceList = null;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.highlight_remove,
                                  color: Colors.white,
                                ))))),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Image.asset(
                        'Importpdficon.png',
                        height: 35,
                        width: 35,
                      ),
                    ),
                    Text(PDFName,
                        style: const TextStyle(
                          color: Color.fromRGBO(251, 253, 247, 1),
                          fontFamily: 'Eczar',
                          fontSize: 20,
                        )),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Widget UploadPDFButton() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        child: FittedBox(
          child: ElevatedButton(
              onPressed: () async {
                List<PDFfile>? files = await PdfAPI.selectFiles();
                if (files == null) {
                  print("problem");
                }
                Map<String, List<List<SentencePart>>> mistakes =
                    await Analyzer.getMistakes(files!);
                setState(() {
                  Analyzer.reportData.addAll(mistakes);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF4D6658),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
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
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
