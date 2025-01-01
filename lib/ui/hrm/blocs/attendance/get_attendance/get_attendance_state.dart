part of 'get_attendance_bloc.dart';

@freezed
class GetAttendanceState with _$GetAttendanceState {
  const factory GetAttendanceState.initial() = _Initial;
  const factory GetAttendanceState.loading() = _Loading;
  const factory GetAttendanceState.success(List<Attendance> attendance) =
      _Success;
  const factory GetAttendanceState.failed(String message) = _Failed;
}
