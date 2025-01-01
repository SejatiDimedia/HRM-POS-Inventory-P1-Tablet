part of 'edit_attendance_bloc.dart';

@freezed
class EditAttendanceEvent with _$EditAttendanceEvent {
  const factory EditAttendanceEvent.started() = _Started;
  const factory EditAttendanceEvent.edit(
      AttendanceRequestModel dataRequest, int id) = _Edit;
}
