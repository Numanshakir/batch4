class Album {
  int userId;
  int id;
  String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json["userId"] ?? 0,
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
    );
  }

  static List<Album> toListData(List<dynamic> json) {
    List<Album> data = [];
    for (int index = 0; index < json.length; index++) {
      data.add(Album.fromJson(json[index]));
    }
    return data;
  }
  static List<Album> jsonToModelList(List<dynamic> json) {
    return json.map((e) => Album.fromJson(e)).toList();
  }

}
