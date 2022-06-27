import 'package:flutter/material.dart';

class ExportAllButton extends StatelessWidget {
  const ExportAllButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}