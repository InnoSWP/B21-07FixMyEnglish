import 'package:flutter/material.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35, vertical: 15),
                ),
                child: Row(
                  children: <Widget>[
                    const Text("Export",
                        style: TextStyle(
                            color: Color.fromRGBO(
                                251, 253, 247, 1),
                            fontFamily: 'Eczar',
                            fontSize: 30,
                        )),
                  ],
                )),
          ),
      ),
    );
  }
}
