import 'package:flutter/material.dart';
import 'AppBarActionHome.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  static const double heightOfAppBarWidget = 85;
  BuildContext contextOfMainPage;

  MainAppBarWidget(this.contextOfMainPage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: heightOfAppBarWidget,
      backgroundColor: const Color.fromRGBO(242, 238, 225, 1),
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Fix my English',
        style: TextStyle(
            color: Color.fromRGBO(134, 73, 33, 1),
            fontFamily: 'Eczar',
            fontSize: 45,
            ),
      ),
      actions: <Widget>[
        //FittedBox(child:
        SvgPicture.asset("vectortransition.svg"),
        //),
        AppBarActionHome(contextOfMainPage),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(heightOfAppBarWidget);
}
