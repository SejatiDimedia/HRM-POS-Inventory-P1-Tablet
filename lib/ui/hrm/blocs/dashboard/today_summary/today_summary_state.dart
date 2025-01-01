part of 'today_summary_bloc.dart';

@freezed
class TodaySummaryState with _$TodaySummaryState {
  const factory TodaySummaryState.initial() = _Initial;
  const factory TodaySummaryState.loading() = _Loading;
  const factory TodaySummaryState.success(TodaySummary data) = _Success;
  const factory TodaySummaryState.failed(String message) = _Failed;
}
