import 'package:json_annotation/json_annotation.dart';

part 'mcq_model.g.dart';

@JsonSerializable()
class MCQ {
  final String id;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;
  final String topic;
  final String difficulty;
  final String? sourceReference;

  const MCQ({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
    required this.topic,
    required this.difficulty,
    this.sourceReference,
  });

  factory MCQ.fromJson(Map<String, dynamic> json) => _$MCQFromJson(json);
  Map<String, dynamic> toJson() => _$MCQToJson(this);
}
