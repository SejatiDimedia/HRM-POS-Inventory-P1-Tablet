part of 'leave_bloc.dart';

@freezed
class LeaveEvent with _$LeaveEvent {
  const factory LeaveEvent.started() = _Started;
  const factory LeaveEvent.fetch() = _Fetch;
  const factory LeaveEvent.addNewLeave(Leave newLeave) = _AddNewLeave;
  const factory LeaveEvent.add(LeaveRequestModel dataRequest) = _Add;
  const factory LeaveEvent.edit(LeaveRequestModel dataRequest, int id) = _Edit;
  const factory LeaveEvent.updateLeave(Leave updatedLeave) = _UpdateLeave;
  const factory LeaveEvent.delete(int id) = _Delete;
}
