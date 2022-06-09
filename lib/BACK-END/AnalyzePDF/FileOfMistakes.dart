import 'MistakeClass.dart';

class FileOfMistakes{
  late String name;
  late List<Mistake> mistakes;

  FileOfMistakes(String name, List<Mistake> mistakes){
    this.name = name;
    this.mistakes = mistakes;
  }
}