import 'package:flutter/material.dart';
import '../MainPageForAnalysisMultiplePDFs/MainMainPageForAnalysisPDFsWidget.dart';
import '../MainPageForAnalysisMultiplePDFs/MainMainPageForAnalysisPDFsWidget.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Center(
        child: FittedBox(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MainMainPageForAnalysisPDFsWidget();
                }));
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(134, 73, 33, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 35, vertical: 10),
              ),
              child: Row(
                children: <Widget>[
                  const Text("Upload",
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