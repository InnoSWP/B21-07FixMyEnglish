import 'package:flutter/material.dart';
import 'MistakenSentenceElement.dart';

class MistakenSentenceList extends StatefulWidget {
  const MistakenSentenceList({Key? key}) : super(key: key);

  @override
  State<MistakenSentenceList> createState() => _MistakenSentenceListState();
}

class _MistakenSentenceListState extends State<MistakenSentenceList> {
  List<String> PDFnames = [
    "1",
    "2fajsklfjasjl;df;jafffsfdsafadsfasdfasdfasdfasdfasdfasfasfasdfasdfsadfasdfWskfjklasjdfjasjfk;lasdjfklasjfadsjfjkljdskfjaskjfkajdkfjasdkfjaskljfkasdjfklasdjfjadsklfjsdlfjlasdjfklasdjflksdj;lasjfdfkasjfksjdflksadjfklasjdfkjasdklfjaseklfjasdklfjkasl;djfaskdlfjsadfjasld;jfas;lasjdfl;akjsdf;sjiotuwioejtoicvlknlkerufldmfnlisugslkjtjilsjvlsnmerljuiocjfnawklerjfioujrlkwjsiodfuisjmrnjlkesjudjsersdjfkljsdklfjajsdklfajdsflkdjskljadskfjadslfjlsdkjfkdsjfklasdjklfjasdklfjsddfjuxicnmfskfjwefsdvjjoilkmfsdoj;gjnrefsdv;fhogrefsjldvof;grnmlefksdvj;ofgtrwnjekmdfsijvgtrwnekmfdjsvfhdlinrwekfsmdj;zfhungrtjshofn;grtljshon;grtjjsbfhon;gtwrgjsfbhdnogjrwejfadhobdgnjtwrefsjdvhfobngrjfeadjbhudog",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",

  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: _getListData(),
      ),
    );
  }

  _getListData() {
    List<Widget> widgets = [];
    for (var element in PDFnames) {
      widgets.add(MistakenSentenceElement(element));
    }
    return widgets;
  }
}
