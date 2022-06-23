import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/AnalyzePDF.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/SentencePartClass.dart';
import 'package:web1_app/FRONT-END/MainPageForAnalysisInputText/MainMainPageForAnalysisInputTextWidget.dart';
import 'package:web1_app/FRONT-END/MainPageForAnalysisMultiplePDFs/MainMainPageForAnalysisPDFsWidget.dart';

void main() {
  // adding reports to widget
  List<List<SentencePart>> report_1 = [[SentencePart("Hello ", null),SentencePart("it's", "improper usage"),SentencePart(" me, Mario", null)]];
  List<List<SentencePart>> report_2 = [[SentencePart("I eat ", null),SentencePart("8", "improper usage of numbers"),SentencePart(" eggs.", null)]];
  Map<String, List<List<SentencePart>>> files = <String, List<List<SentencePart>>>{};
  files["file_1.pdf"] = report_1;
  files["file_2.pdf"] = report_2;
  Analyzer.reportData.addAll(files);

  group('Deleting tests', ()
  {
    testWidgets("Remove file 1", (WidgetTester tester) async {
      final deleteButton = find.byKey(ValueKey("delete button file_1.pdf"));

      await tester.pumpWidget(MaterialApp(home: MainMainPageForAnalysisPDFsWidget()));
      expect(find.text("file_1.pdf"), findsOneWidget);
      expect(Analyzer.reportData["file_1.pdf"]?[0].length, 3);
      await tester.tap(deleteButton);
      await tester.pump();
      expect(find.text("file_1.pdf"), findsNothing);
      expect(Analyzer.reportData["file_1.pdf"], null);
    });

    testWidgets("Remove file 2", (WidgetTester tester) async {
      final deleteButton = find.byKey(ValueKey("delete button file_2.pdf"));

      await tester.pumpWidget(MaterialApp(home: MainMainPageForAnalysisPDFsWidget()));
      expect(find.text("file_2.pdf"), findsOneWidget);
      expect(Analyzer.reportData["file_2.pdf"]?[0].length, 3);
      await tester.tap(deleteButton);
      await tester.pump();
      expect(find.text("file_2.pdf"), findsNothing);
      expect(Analyzer.reportData["file_2.pdf"], null);
    });
  });
}