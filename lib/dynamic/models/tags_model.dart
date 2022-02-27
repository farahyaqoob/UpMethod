import 'package:json_annotation/json_annotation.dart';
part 'tags_model.g.dart';

@JsonSerializable()
class Tags {
  String name;
  Tags({this.name});
  factory Tags.fromJson(Map<String, dynamic> data) => _$TagsFromJson(data);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
