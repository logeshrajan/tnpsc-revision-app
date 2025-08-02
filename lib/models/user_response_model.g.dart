// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  mcqId: json['mcqId'] as String,
  selectedAnswerIndex: (json['selectedAnswerIndex'] as num).toInt(),
  isCorrect: json['isCorrect'] as bool,
  timestamp: DateTime.parse(json['timestamp'] as String),
  timeTakenSeconds: (json['timeTakenSeconds'] as num).toInt(),
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'mcqId': instance.mcqId,
      'selectedAnswerIndex': instance.selectedAnswerIndex,
      'isCorrect': instance.isCorrect,
      'timestamp': instance.timestamp.toIso8601String(),
      'timeTakenSeconds': instance.timeTakenSeconds,
    };
