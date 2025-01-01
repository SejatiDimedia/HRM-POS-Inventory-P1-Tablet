part of 'add_attendance_bloc.dart';

@freezed
class AddAttendanceEvent with _$AddAttendanceEvent {
  const factory AddAttendanceEvent.started() = _Started;
  const factory AddAttendanceEvent.add(AttendanceRequestModel dataRequest) =
      _Add;
}
