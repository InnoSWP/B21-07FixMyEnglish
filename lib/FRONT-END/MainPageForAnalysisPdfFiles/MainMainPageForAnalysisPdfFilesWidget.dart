import 'package:flutter/material.dart';
import 'MainAppBarWidget.dart';
import 'ReportPartWidget.dart';
import 'TextInputPartWidget.dart';

class MainMainPageForAnalysisPdfFilesWidget extends StatefulWidget {
  const MainMainPageForAnalysisPdfFilesWidget({Key? key}) : super(key: key);

  @override
  _MainMainPageForAnalysisPdfFilesWidget createState() =>
      _MainMainPageForAnalysisPdfFilesWidget();
}

class _MainMainPageForAnalysisPdfFilesWidget
    extends State<MainMainPageForAnalysisPdfFilesWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator IntroPage - FRAME
    var list = ["First", "Second", "Third"];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: MainAppBarWidget(context),
          body: Container(
                child: Row(
              children: [
                Expanded(child: ReportPartWidget(list)),
                TextInputPartWidget(),
              ],
            )),
          ),
        );
  }
}
