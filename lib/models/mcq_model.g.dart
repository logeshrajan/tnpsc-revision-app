// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mcq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MCQ _$MCQFromJson(Map<String, dynamic> json) => MCQ(
  id: json['id'] as String,
  question: json['question'] as String,
  options: (json['options'] as List<dynamic>).map((e) => e as String).toList(),
  correctAnswerIndex: (json['correctAnswerIndex'] as num).toInt(),
  explanation: json['explanation'] as String,
  topic: json['topic'] as String,
  difficulty: json['difficulty'] as String,
  sourceReference: json['sourceReference'] as String?,
);

Map<String, dynamic> _$MCQToJson(MCQ instance) => <String, dynamic>{
  'id': instance.id,
  'question': instance.question,
  'options': instance.options,
  'correctAnswerIndex': instance.correctAnswerIndex,
  'explanation': instance.explanation,
  'topic': instance.topic,
  'difficulty': instance.difficulty,
  'sourceReference': instance.sourceReference,
};
