part of 'add_attendance_bloc.dart';

@freezed
class AddAttendanceState with _$AddAttendanceState {
  const factory AddAttendanceState.initial() = _Initial;
  const factory AddAttendanceState.loading() = _Loading;
  const factory AddAttendanceState.success(
      AddAttendanceResponseModel attendance) = _Success;
  const factory AddAttendanceState.failed(String message) = _Failed;
}
