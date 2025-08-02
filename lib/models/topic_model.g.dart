// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Topic _$TopicFromJson(Map<String, dynamic> json) => Topic(
  id: json['id'] as String,
  name: json['name'] as String,
  subject: json['subject'] as String,
  classLevel: (json['classLevel'] as num).toInt(),
  chapters:
      (json['chapters'] as List<dynamic>).map((e) => e as String).toList(),
  description: json['description'] as String?,
);

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'subject': instance.subject,
  'classLevel': instance.classLevel,
  'chapters': instance.chapters,
  'description': instance.description,
};
