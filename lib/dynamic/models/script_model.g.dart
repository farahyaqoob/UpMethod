// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'script_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScriptModel _$ScriptModelFromJson(Map<String, dynamic> json) {
  return ScriptModel(
    id: json['id'] as int,
    category: json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
    content: json['content'] as String,
    created_at: json['created_at'] as String,
    poster: json['poster'] as String,
    tags: (json['tags'] as List)
        ?.map(
            (e) => e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$ScriptModelToJson(ScriptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'poster': instance.poster,
      'created_at': instance.created_at,
      'category': instance.category?.toJson(),
      'tags': instance.tags?.map((e) => e?.toJson())?.toList(),
    };
