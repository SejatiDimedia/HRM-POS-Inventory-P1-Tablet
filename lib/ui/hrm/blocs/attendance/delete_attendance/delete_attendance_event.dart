part of 'delete_attendance_bloc.dart';

@freezed
class DeleteAttendanceEvent with _$DeleteAttendanceEvent {
  const factory DeleteAttendanceEvent.started() = _Started;
  const factory DeleteAttendanceEvent.delete(int id) = _Delete;
}
