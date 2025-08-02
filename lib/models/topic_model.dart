import 'package:json_annotation/json_annotation.dart';

part 'topic_model.g.dart';

@JsonSerializable()
class Topic {
  final String id;
  final String name;
  final String subject;
  final int classLevel;
  final List<String> chapters;
  final String? description;

  const Topic({
    required this.id,
    required this.name,
    required this.subject,
    required this.classLevel,
    required this.chapters,
    this.description,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}
