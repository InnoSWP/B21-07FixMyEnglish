import 'package:flutter/material.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/PDFfileClass.dart';
import '../MainPageForAnalysisMultiplePDFs/MainMainPageForAnalysisPDFsWidget.dart';
import '../MainPageForAnalysisMultiplePDFs/MainMainPageForAnalysisPDFsWidget.dart';
import '../../BACK-END/AnalyzePDF/UploadPDF.dart';
import '../../BACK-END/AnalyzePDF/AnalyzePDF.dart';
import '../../BACK-END/AnalyzePDF/SentencePartClass.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Center(
        child: FittedBox(
          child: ElevatedButton (
              onPressed: () async{
                List<PDFfile>? files = await PdfAPI.selectFiles();
                if (files == null){
                  print("problem");
                }

                // TODO: сделай по красоте, Marat
                //Map<String, List<List<SentencePart>>> mistakes = await Analyzer.getMistakes(files!);
                // {"?" : [[], [], []], [[], [], []], [[], [], []]}
                Map<String, List<List<SentencePart>>> mistakes = {
                  "test.pdf":
                  [
                    [
                      SentencePart("This solution is", null),
                      SentencePart("n't", "Описание ошибки"),
                      SentencePart("the most effective one.", null)
                    ],
                    [
                      SentencePart("There are", "bad"),
                      SentencePart("three ways to solve this problem", null)
                    ]
                    ]
                };
                Analyzer.reportData.addAll(mistakes);


                Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return const MainMainPageForAnalysisPDFsWidget();
                     })
                );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(134, 73, 33, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 35, vertical: 15),
              ),
              child: Row(
                children: <Widget>[
                  const Text("Upload",
                      style: TextStyle(
                          color: Color.fromRGBO(
                              251, 253, 247, 1),
                          fontFamily: 'Eczar',
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          height: 1)),
                  Padding(
                    padding:
                    const EdgeInsets.fromLTRB(5, 0, 0, 0),
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