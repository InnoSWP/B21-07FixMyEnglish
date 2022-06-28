class SentencePart{

  late String text; // the text of sentence
  late String? description;
  late String? label;
  SentencePart(String text, String? desc, String? label){
    this.text = text;
    this.description = desc;
    this.label = label;
  }
}