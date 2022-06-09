import 'package:flutter/material.dart';

class AnalysisTextField extends StatelessWidget{
  const AnalysisTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                offset: Offset(1, 3),
                spreadRadius: 1,
              ),
            ],
            borderRadius:
            BorderRadius.all(Radius.circular(23)),
          ),
          margin: const EdgeInsets.only(top: 55),
          child: const TextField(
              cursorColor: Color.fromRGBO(134, 73, 33, 1),
              cursorWidth: 2,
              cursorRadius: Radius.circular(3),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 20, right: 27, left: 27, bottom: 20),
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(23)),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                hintText: "Input text for analysis",
                fillColor: Color(0xFFF2EEE1),
                filled: true,
              ),
              style: TextStyle(height: 1.5,
                  fontFamily: 'Eczar',
                  fontSize: 20, color: Colors.black),
              maxLines: 9,
              minLines: 1)),
    );
  }

}