import 'package:flutter/material.dart';

class IntroAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  static const double heightOfAppBarWidget = 130;

  const IntroAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 200,
      automaticallyImplyLeading: false,
      toolbarHeight: heightOfAppBarWidget,
      backgroundColor: const Color.fromRGBO(242, 238, 225, 1),
      elevation: 0,
      centerTitle: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 87,
            child: Text("Fix my English",
                style: TextStyle(
                    color: Color.fromRGBO(134, 73, 33, 1),
                    fontSize: 60,
                    fontFamily: 'Eczar',
                    fontWeight: FontWeight.w600)),
          ),
           RichText(
            text: const TextSpan(
              text: '',
              children: [
                TextSpan(
                    text: "powered by ",
                    style: TextStyle(
                      color: Color.fromRGBO(134, 73, 33, 1),
                      height: 1.5,
                      fontSize: 25,
                      fontFamily: 'Eczar',
                    )),
                TextSpan(
                    text: "iExtract",
                    style: TextStyle(
                      color: Color.fromRGBO(134, 73, 33, 1),
                      height: 1.5,
                      fontSize: 25,
                      fontFamily: 'Eczar',
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(heightOfAppBarWidget);
}
