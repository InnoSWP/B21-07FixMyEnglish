import 'dart:typed_data';

class DefaultFile{
  // class that represent a raw file
  late Uint8List? bytes;
  late String name;
  DefaultFile(Uint8List? bytes, String name){
    this.bytes = bytes;
    this.name = name;
  }
}