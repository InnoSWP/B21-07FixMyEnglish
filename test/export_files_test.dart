import 'package:web1_app/BACK-END/AnalyzePDF/AnalyzePDF.dart';
import 'package:web1_app/BACK-END/AnalyzePDF/SentencePartClass.dart';
import 'package:web1_app/BACK-END/Exporting/ExportFile.dart';
import 'package:test/test.dart';

void main() {
  List<List<SentencePart>> report_1 = [[SentencePart("Hello ", null, null),SentencePart("it's", "improper usage", "improper"),SentencePart(" me, Mario", null, null)]];
  List<List<SentencePart>> report_2 = [[SentencePart("I eat ", null, null),SentencePart("8", "improper usage of numbers", "digit"),SentencePart(" eggs.", null, null)]];
  Map<String, List<List<SentencePart>>> files = <String, List<List<SentencePart>>>{};
  files["file_1"] = report_1;
  files["file_2"] = report_2;
  Analyzer.reportData.addAll(files);

  group('Exporting tests', ()
  {
    test('Getting csv 1', () {
      String csv = Exporter.getCsv("file_1");
      expect(csv,
          "Sentence,Mistake,Description\r\n\"Hello it's me, Mario\",it's,improper usage");
    });
    test('Getting csv 2', () {
      String csv = Exporter.getCsv("file_2");
      expect(csv,
          "Sentence,Mistake,Description\r\nI eat 8 eggs.,8,improper usage of numbers");
    });
  });
}