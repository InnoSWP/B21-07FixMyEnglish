import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/AnalyzePDF.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/SentencePartClass.dart';
import 'package:web1_app/FRONT-END/IntroPage/MainIntroWidget.dart';
import 'package:web1_app/FRONT-END/MainPageForAnalysisInputText/MainMainPageForAnalysisInputTextWidget.dart';

void main() {
  // adding reports to widget
  group('Writing inside application tests', ()
  {
    testWidgets("Writing text 1", (WidgetTester tester) async {
      final writeField = find.byKey(ValueKey("textField"));

      await tester.pumpWidget(MaterialApp(home: IntroWidget()));
      await tester.enterText(writeField, "Hello, It's Mario.");
      await tester.pump();

      expect(find.text("Hello, It's Mario."), findsOneWidget);
    });

    testWidgets("Writing text 2", (WidgetTester tester) async {
      final writeField = find.byKey(ValueKey("textField"));

      await tester.pumpWidget(MaterialApp(home: IntroWidget()));
      await tester.enterText(writeField, "I eat 100 eggs every day.");
      await tester.pump();

      expect(find.text("I eat 100 eggs every day."), findsOneWidget);
    });

    testWidgets("Writing text 3", (WidgetTester tester) async {
      final writeField = find.byKey(ValueKey("textField"));

      await tester.pumpWidget(MaterialApp(home: MainMainPageForAnalysisInputTextWidget()));
      await tester.enterText(writeField, "Hello, It's Mario.");
      await tester.pump();

      expect(find.text("Hello, It's Mario."), findsOneWidget);
    });

    testWidgets("Writing text 4", (WidgetTester tester) async {
      final writeField = find.byKey(ValueKey("textField"));

      await tester.pumpWidget(MaterialApp(home: MainMainPageForAnalysisInputTextWidget()));
      await tester.enterText(writeField, "I eat 100 eggs every day.");
      await tester.pump();

      expect(find.text("I eat 100 eggs every day."), findsOneWidget);
    });
  });
}