import 'package:flutter/material.dart';
class PDFElementWidget extends StatelessWidget {
  PDFElementWidget(this.text, {Key? key}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
        child: ElevatedButton(
            onPressed: () {print(text);},
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF62806F),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding:
              const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Image.asset(
                    'Importpdficon.png',
                    height: 35,
                    width: 35,
                  ),
                ),
                Text(text,
                    style: const TextStyle(
                        color: Color.fromRGBO(251, 253, 247, 1),
                        fontFamily: 'Eczar',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        height: 1)),
              ],
            )),
      ),
    );
  }
}
