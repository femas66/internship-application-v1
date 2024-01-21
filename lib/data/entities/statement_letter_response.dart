import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkl_apps/data/statement_letter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'statement_letter_response.g.dart';

@JsonSerializable()
class StatementLetterResponse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "sp")
  final String sp;
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "letter_head")
  final String letterHead;
  @JsonKey(name: "proof")
  final String proof;
  @JsonKey(name: "created_at")
  final String createdAt;

  StatementLetterResponse({
    required this.id,
    required this.description,
    required this.sp,
    required this.date,
    required this.letterHead,
    required this.proof,
    required this.createdAt,
  });

  factory StatementLetterResponse.fromJson(Map<String, dynamic> json) =>
      _$StatementLetterResponseFromJson(json);

  StatementLetter toStatementLetter() => StatementLetter(
        id: id,
        description: description,
        sp: sp,
        date: date,
        letterHead: letterHead,
        proof: proof,
        createdAt: createdAt,
      );
}
