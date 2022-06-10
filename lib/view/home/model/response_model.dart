import 'dart:collection';

class CharacterResponseModel {
  CharacterResponseModel({this.characterMapsList, this.count});

  List? characterMapsList;
  int? count;

  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) {
    LinkedHashMap<dynamic, dynamic> map = json['data'];
    var hashMap = HashMap.from(map);
    var characterMapsList = hashMap['results'];
    return CharacterResponseModel(
      characterMapsList: characterMapsList,
      count: hashMap['total'],
    );
  }
}

class ComicResponseModel {
  ComicResponseModel({this.comicsMapsList});

  List? comicsMapsList;

  factory ComicResponseModel.fromJson(Map<String, dynamic> json) {
    LinkedHashMap<dynamic, dynamic> map = json['data'];
    var hashMap = HashMap.from(map);
    var comicsMapsList = hashMap['results'];
    return ComicResponseModel(
      comicsMapsList: comicsMapsList,
    );
  }
}
