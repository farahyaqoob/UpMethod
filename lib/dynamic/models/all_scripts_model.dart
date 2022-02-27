class AllScriptModel {
  AllScriptModel({
    this.id,
    this.title,
    this.poster,
    this.createdAt,
  });

  int id;
  String title;
  String poster;
  DateTime createdAt;

  factory AllScriptModel.fromJson(Map<String, dynamic> json) => AllScriptModel(
        id: json["id"],
        title: json["title"],
        poster: json["poster"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "poster": poster,
        "created_at": createdAt.toIso8601String(),
      };
}
