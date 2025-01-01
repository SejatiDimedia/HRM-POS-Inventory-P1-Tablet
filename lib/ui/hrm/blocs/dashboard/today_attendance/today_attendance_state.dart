part of 'today_attendance_bloc.dart';

@freezed
class TodayAttendanceState with _$TodayAttendanceState {
  const factory TodayAttendanceState.initial() = _Initial;
  const factory TodayAttendanceState.loading() = _Loading;
  const factory TodayAttendanceState.success(List<TodayAttendance> data) =
      _Success;
  const factory TodayAttendanceState.failed(String message) = _Failed;
}
