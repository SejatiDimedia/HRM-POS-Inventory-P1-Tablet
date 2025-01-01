part of 'leave_type_bloc.dart';

@freezed
class LeaveTypeState with _$LeaveTypeState {
  const factory LeaveTypeState.initial() = _Initial;
  const factory LeaveTypeState.loading() = _Loading;
  const factory LeaveTypeState.success(List<LeaveType> data) = _Success;
  const factory LeaveTypeState.failed(String message) = _Failed;
}
