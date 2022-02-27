class UserResponse {
  UserResponse({
    this.id,
    this.uid,
    this.profilePicture,
    this.firstName,
    this.lastName,
  });

  int id;
  String uid;
  String profilePicture;
  String firstName;
  String lastName;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        uid: json["uid"],
        profilePicture: json["profile_picture"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "profile_picture": profilePicture,
        "first_name": firstName,
        "last_name": lastName,
      };
}
