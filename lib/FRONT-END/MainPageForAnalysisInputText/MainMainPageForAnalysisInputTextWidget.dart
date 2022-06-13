import 'package:flutter/material.dart';
import 'MainAppBarWidget.dart';
import 'ReportPartWidget.dart';
import 'TextInputPartWidget.dart';

class MainMainPageForAnalysisInputTextWidget extends StatefulWidget {
  const MainMainPageForAnalysisInputTextWidget({Key? key}) : super(key: key);

  @override
  _MainMainPageForAnalysisInputTextWidget createState() =>
      _MainMainPageForAnalysisInputTextWidget();
}

class _MainMainPageForAnalysisInputTextWidget
    extends State<MainMainPageForAnalysisInputTextWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator IntroPage - FRAME
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: MainAppBarWidget(context),
          body: Container(
                child: Row(
              children: [
                Expanded(child: ReportPartWidget()),
                TextInputPartWidget(),
              ],
            )),
          ),
        );
  }
}
