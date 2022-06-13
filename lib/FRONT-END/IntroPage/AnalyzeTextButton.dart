import 'package:flutter/material.dart';
import '../MainPageForAnalysisInputText/MainMainPageForAnalysisInputTextWidget.dart';
import '../../BACK-END/AnalyzePDF/AnalyzePDF.dart';
import '../../BACK-END/AnalyzePDF/SentencePartClass.dart';

class AnalyzeTextButton extends StatelessWidget{
  const AnalyzeTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: FittedBox(
          child: ElevatedButton(
              onPressed: (){
                Map<String, List<List<SentencePart>>> mistakes = {
                  "test1.pdf": [
                    [
                      SentencePart("This solution is", null),
                      SentencePart("n't ", "Описание ошибки"),
                      SentencePart("the most effective one.", null)
                    ],
                    [
                      SentencePart("There are ", "bad"),
                      SentencePart("three ways to solve this problem", null)
                    ]
                  ],
                  "test2.pdf": [
                    [
                      SentencePart("Second: This solution is", null),
                      SentencePart("n't ", "Описание ошибки"),
                      SentencePart("the most effective one.", null)
                    ],
                    [
                      SentencePart("Second: There are ", "bad"),
                      SentencePart("three ways to solve this problem", null)
                    ]
                  ]
                };
                Analyzer.reportData.addAll(mistakes);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MainMainPageForAnalysisInputTextWidget();
                }));
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF4D6658),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
              ),
              child: Row(
                children: <Widget>[
                  const Text("Analyze text",
                      style: TextStyle(
                          color: Color.fromRGBO(
                              251, 253, 247, 1),
                          fontFamily: 'Eczar',
                          fontSize: 30,
                          )),
                  Padding(
                    padding:
                    const EdgeInsets.fromLTRB(5, 0, 0, 0),
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