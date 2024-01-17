import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_statistic.freezed.dart';
part 'dashboard_statistic.g.dart';

@freezed
class DashboardStatistic with _$DashboardStatistic {
  factory DashboardStatistic({
    required int present,
    required int permission,
    required int alpha,
    required int journal,
  }) = _DashboardStatistic;

  factory DashboardStatistic.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatisticFromJson(json);
}
