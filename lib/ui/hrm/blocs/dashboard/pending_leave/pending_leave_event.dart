part of 'pending_leave_bloc.dart';

@freezed
class PendingLeaveEvent with _$PendingLeaveEvent {
  const factory PendingLeaveEvent.started() = _Started;
  const factory PendingLeaveEvent.fetch() = _Fetch;
}
