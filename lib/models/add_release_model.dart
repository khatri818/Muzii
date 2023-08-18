

import 'dart:convert';

class AddReleaseModel {
  String songName;
  String labelName;
  String releaseDate;
  String language;
  bool explicit;
  bool ytContentId;
  String userId;
  int genreId;
  int subgenreId;
  int moodId;

  AddReleaseModel({
    required this.songName,
    required this.labelName,
    required this.releaseDate,
    required this.language,
    required this.explicit,
    required this.ytContentId,
    required this.userId,
    required this.genreId,
    required this.subgenreId,
    required this.moodId,
  });

  // Convert object to a map
  Map<String, dynamic> toMap() {
    return {
      'songName': songName,
      'labelName': labelName,
      'releaseDate': releaseDate,
      'language': language,
      'explicit': explicit,
      'ytContentId': ytContentId,
      'userId': userId,
      'genreId': genreId,
      'subgenreId': subgenreId,
      'moodId': moodId,
    };
  }

  // Create an object from a map
  static AddReleaseModel fromMap(Map<String, dynamic> map) {
    return AddReleaseModel(
      songName: map['songName'],
      labelName: map['labelName'],
      releaseDate: map['releaseDate'],
      language: map['language'],
      explicit: map['explicit'],
      ytContentId: map['ytContentId'],
      userId: map['userId'],
      genreId: map['genreId'],
      subgenreId: map['subgenreId'],
      moodId: map['moodId'],
    );
  }

  // Create an object from JSON string
  static AddReleaseModel fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return AddReleaseModel.fromMap(map);
  }

  // Convert object to JSON string
  String toJson() {
    Map<String, dynamic> map = toMap();
    return jsonEncode(map);
  }
}
