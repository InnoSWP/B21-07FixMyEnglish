class Mistake{
  late String wrong_phrase;
  late String sentence;
  late String label;
  late String description;

  Mistake.fromJson(Map<String, dynamic> json) {
    wrong_phrase = json['match'];
    sentence = json['sentence'];
    label = json['label'];
    description = json['description'];
  }
}