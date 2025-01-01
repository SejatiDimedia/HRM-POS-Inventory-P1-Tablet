part of 'delete_attendance_bloc.dart';

@freezed
class DeleteAttendanceState with _$DeleteAttendanceState {
  const factory DeleteAttendanceState.initial() = _Initial;
  const factory DeleteAttendanceState.loading() = _Loading;
  const factory DeleteAttendanceState.success(DeleteResponseModel data) =
      _Success;
  const factory DeleteAttendanceState.failed(String message) = _Failed;
}
