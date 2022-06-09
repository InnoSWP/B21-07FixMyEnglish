import 'package:flutter/material.dart';

class MistakenSentenceElement extends StatelessWidget {
  MistakenSentenceElement(this.text, {Key? key}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
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
            Text(text,
                style: const TextStyle(
                  height: 1.5,
                  fontSize: 18,
                  fontFamily: 'Eczar',
                )),
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
                            onTap: () {},
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
}
