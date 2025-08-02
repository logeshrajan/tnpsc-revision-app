import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponse {
  final String mcqId;
  final int selectedAnswerIndex;
  final bool isCorrect;
  final DateTime timestamp;
  final int timeTakenSeconds;

  const UserResponse({
    required this.mcqId,
    required this.selectedAnswerIndex,
    required this.isCorrect,
    required this.timestamp,
    required this.timeTakenSeconds,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
