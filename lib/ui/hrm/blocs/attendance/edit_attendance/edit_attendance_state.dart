part of 'edit_attendance_bloc.dart';

@freezed
class EditAttendanceState with _$EditAttendanceState {
  const factory EditAttendanceState.initial() = _Initial;
  const factory EditAttendanceState.loading() = _Loading;
  const factory EditAttendanceState.success(
      EditAttendanceResponseModel attendance) = _Success;
  const factory EditAttendanceState.failed(String message) = _Failed;
}
