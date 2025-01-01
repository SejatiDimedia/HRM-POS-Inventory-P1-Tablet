part of 'pending_leave_bloc.dart';

@freezed
class PendingLeaveState with _$PendingLeaveState {
  const factory PendingLeaveState.initial() = _Initial;
  const factory PendingLeaveState.loading() = _Loading;
  const factory PendingLeaveState.success(List<PendingLeave> data) = _Success;
  const factory PendingLeaveState.failed(String message) = _Failed;
}
