import 'package:freezed_annotation/freezed_annotation.dart';

part 'statement_letter.freezed.dart';
part 'statement_letter.g.dart';

@freezed
class StatementLetter with _$StatementLetter {
  factory StatementLetter({
    required int id,
    required String description,
    required String sp,
    required String date,
    required String letterHead,
    required String proof,
    required String createdAt,
  }) = _StatementLetter;
  factory StatementLetter.fromJson(Map<String, dynamic> json) =>
      _$StatementLetterFromJson(json);
}
