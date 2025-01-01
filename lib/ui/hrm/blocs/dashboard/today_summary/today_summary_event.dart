part of 'today_summary_bloc.dart';

@freezed
class TodaySummaryEvent with _$TodaySummaryEvent {
  const factory TodaySummaryEvent.started() = _Started;
  const factory TodaySummaryEvent.fetch() = _Fetch;
}
