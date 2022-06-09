import 'package:flutter/material.dart';
import 'MainAppBarWidget.dart';
import 'ReportPartWidget.dart';
import 'PartWithPDFsWidget.dart';

class MainMainPageForAnalysisPDFsWidget extends StatefulWidget {
  const MainMainPageForAnalysisPDFsWidget ({Key? key}) : super(key: key);

  @override
  _MainMainPageForAnalysisPDFsWidget  createState() =>
      _MainMainPageForAnalysisPDFsWidget();
}

class _MainMainPageForAnalysisPDFsWidget
    extends State<MainMainPageForAnalysisPDFsWidget > {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: MainAppBarWidget(context),
          body: Container(
                child: Row(
              children: [
                Expanded(child: ReportPartWidget()),
                PartWithPDFsWidget(),
              ],
            )),
          ),
        );
  }
}
