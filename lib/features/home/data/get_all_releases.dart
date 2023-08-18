

import '../../../models/add_release_model.dart';

class GetAllRelease{  
  List<AddReleaseModel> releases = [
    AddReleaseModel(
      songName: "Song A",
      labelName: "Label X",
      releaseDate: "2023-08-17",
      language: "English",
      explicit: false,
      ytContentId: true,
      userId: "user123",
      genreId: 1,
      subgenreId: 101,
      moodId: 201,
    ),
    AddReleaseModel(
      songName: "Song B",
      labelName: "Label Y",
      releaseDate: "2023-08-18",
      language: "Spanish",
      explicit: true,
      ytContentId: false,
      userId: "user456",
      genreId: 2,
      subgenreId: 102,
      moodId: 202,
    ),
    AddReleaseModel(
      songName: "Song C",
      labelName: "Label Z",
      releaseDate: "2023-08-19",
      language: "French",
      explicit: true,
      ytContentId: true,
      userId: "user789",
      genreId: 3,
      subgenreId: 103,
      moodId: 203,
    ),
  ];
  Future<List<AddReleaseModel>> getAllReleaseModel() async{
    Future.delayed(Duration(seconds: 2), () {
    print("Fetching data from backend");

  });

  return Future.value(releases);
  
  }
}

