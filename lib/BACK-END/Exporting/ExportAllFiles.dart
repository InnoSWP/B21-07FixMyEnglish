import 'package:web1_app/BACK-END/AnalyzePDF/AnalyzePDF.dart';
import 'package:web1_app/BACK-END/Exporting/ExportFile.dart';

void exportAllFileS(){
  for(var file_name in Analyzer.reportData.keys){
    print("Exporting file: " + file_name);
    Exporter.downloadFile(Exporter.getCsv(file_name), file_name);
  }
}