class UserModel {
  UserModel({
    this.apiKey,
    this.firstName,
    this.lastName,
    this.uid,
  });

  String apiKey;
  String firstName;
  String lastName;
  String uid;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        apiKey: json["api_key"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "api_key": apiKey,
        "first_name": firstName,
        "last_name": lastName,
        "uid": uid,
      };
}
