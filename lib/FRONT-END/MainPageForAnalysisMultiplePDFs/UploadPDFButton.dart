import 'package:flutter/material.dart';
import '../../BACK-END/AnalyzePDF/UploadPDF.dart';
import '../../BACK-END/AnalyzePDF/AnalyzePDF.dart';
import '../../BACK-END/AnalyzePDF/SentencePartClass.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/PDFfileClass.dart';

class UploadPDFButton extends StatelessWidget {
  const UploadPDFButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        child: FittedBox(
          child: ElevatedButton(
              onPressed: () async{
                List<PDFfile>? files = await PdfAPI.selectFiles();
                if (files == null){
                  print("problem");
                }
                Map<String, List<List<SentencePart>>> mistakes = await Analyzer.getMistakes(files!);
                Analyzer.reportData.addAll(mistakes);

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
