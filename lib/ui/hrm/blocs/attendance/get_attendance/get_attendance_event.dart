part of 'get_attendance_bloc.dart';

@freezed
class GetAttendanceEvent with _$GetAttendanceEvent {
  const factory GetAttendanceEvent.started() = _Started;
  const factory GetAttendanceEvent.fetch() = _Fetch;
}
