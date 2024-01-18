import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkl_apps/data/student.dart';

part 'journal.freezed.dart';
part 'journal.g.dart';

@freezed
class Journal with _$Journal {
  const factory Journal({
    required int id,
    required Student student,
    String? date,
    String? activity,
    String? image,
  }) = _Journal;

  factory Journal.fromJson(Map<String, dynamic> json) =>
      _$JournalFromJson(json);
}
