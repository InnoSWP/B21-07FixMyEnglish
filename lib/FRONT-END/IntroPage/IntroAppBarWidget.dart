import 'package:flutter/material.dart';

class IntroAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  static const double heightOfAppBarWidget = 85;

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
      title: const Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'Fix my English',
          style: TextStyle(
              color: Color.fromRGBO(134, 73, 33, 1),
              fontFamily: 'Eczar',
              fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(heightOfAppBarWidget);
}
