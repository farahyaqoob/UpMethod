import 'package:json_annotation/json_annotation.dart';
import 'package:up_method_mobile_app/dynamic/models/category_model.dart';
import 'package:up_method_mobile_app/dynamic/models/tags_model.dart';
part 'script_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ScriptModel {
  int id;
  String title;
  String content;
  String poster;
  String created_at;
  Category category;
  List<Tags> tags;
  ScriptModel(
      {this.id,
      this.category,
      this.content,
      this.created_at,
      this.poster,
      this.tags,
      this.title});
  factory ScriptModel.fromJson(Map<String, dynamic> data) =>
      _$ScriptModelFromJson(data);

  Map<String, dynamic> toJson() => _$ScriptModelToJson(this);
}
