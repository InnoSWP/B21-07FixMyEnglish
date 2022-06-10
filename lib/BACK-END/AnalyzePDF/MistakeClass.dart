class Mistake{
  late String wrong_phrase;
  late String sentence;
  late String label;
  late String description;

  Mistake(String wrong_phrase, String sentence, String label, String description){
    this.wrong_phrase = wrong_phrase;
    this.label = label;
    this.sentence = sentence;
    this.description = description;
  }

  Mistake.fromJson(Map<String, dynamic> json) {
    wrong_phrase = json['match'];
    sentence = json['sentence'];
    label = json['label'];
    description = json['description'];
  }
}