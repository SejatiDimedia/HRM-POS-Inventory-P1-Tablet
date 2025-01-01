part of 'today_attendance_bloc.dart';

@freezed
class TodayAttendanceEvent with _$TodayAttendanceEvent {
  const factory TodayAttendanceEvent.started() = _Started;
  const factory TodayAttendanceEvent.fetch() = _Fetch;
}
