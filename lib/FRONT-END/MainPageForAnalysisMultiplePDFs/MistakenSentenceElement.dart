import 'package:flutter/material.dart';

class MistakenSentenceElement extends StatelessWidget {
  MistakenSentenceElement(this.text, {Key? key}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
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
            margin: const EdgeInsets.only(top: 15, right: 30, left:30),
            child: Center(child: Text(text))));
  }
}
