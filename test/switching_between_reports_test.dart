import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/AnalyzePDF.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/SentencePartClass.dart';
import 'package:web1_app/FRONT-END/MainPageForAnalysisMultiplePDFs/MainMainPageForAnalysisPDFsWidget.dart';

void main() {
  // adding reports to widget
  List<List<SentencePart>> report_1 = [[SentencePart("Hello ", null),SentencePart("it's", "improper usage"),SentencePart(" me, Mario", null)]];
  List<List<SentencePart>> report_2 = [[SentencePart("I eat ", null),SentencePart("8", "improper usage of numbers"),SentencePart(" eggs.", null)]];
  Map<String, List<List<SentencePart>>> files = <String, List<List<SentencePart>>>{};
  files["file_1.pdf"] = report_1;
  files["file_2.pdf"] = report_2;
  Analyzer.reportData.addAll(files);

  group('Switching between tests', ()
  {
    testWidgets("Choosing file 1", (WidgetTester tester) async {
      final fileButton = find.byKey(ValueKey("file_2.pdf"));

      await tester.pumpWidget(MaterialApp(home: MainMainPageForAnalysisPDFsWidget()));
      expect(find.text("file_2.pdf"), findsOneWidget);
      await tester.tap(fileButton);
      await tester.pump();

      expect(find.byKey(ValueKey("report part file_2.pdf")), findsOneWidget);

      final elevatedButton = tester.widget<ElevatedButton>(find.byKey(ValueKey("file_2.pdf")));
      final states = <MaterialState>{};
      final bgColor = elevatedButton.style?.backgroundColor?.resolve(states);

      expect(bgColor, const Color(0xFF4D6658));
    });

    testWidgets("Choosing file 2", (WidgetTester tester) async {
      final fileButton = find.byKey(ValueKey("file_1.pdf"));

      await tester.pumpWidget(MaterialApp(home: MainMainPageForAnalysisPDFsWidget()));
      expect(find.text("file_1.pdf"), findsOneWidget);
      await tester.tap(fileButton);
      await tester.pump();

      expect(find.byKey(ValueKey("report part file_1.pdf")), findsOneWidget);

      final elevatedButton = tester.widget<ElevatedButton>(find.byKey(ValueKey("file_1.pdf")));
      final states = <MaterialState>{};
      final bgColor = elevatedButton.style?.backgroundColor?.resolve(states);

      expect(bgColor, const Color(0xFF4D6658));
    });
  });
}