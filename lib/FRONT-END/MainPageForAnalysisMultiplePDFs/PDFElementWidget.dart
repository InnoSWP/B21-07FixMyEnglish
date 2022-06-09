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
            onPressed: () {
              print(text);
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF62806F),
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
                                onTap: () {},
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
                    Text(text,
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
}
