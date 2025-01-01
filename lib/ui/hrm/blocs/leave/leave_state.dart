part of 'leave_bloc.dart';

@freezed
class LeaveState with _$LeaveState {
  const factory LeaveState.initial() = _Initial;
  const factory LeaveState.loading() = _Loading;
  const factory LeaveState.success(List<Leave> data) = _Success;
  const factory LeaveState.successAdd(AddLeaveResponseModel data) = _SuccessAdd;
  const factory LeaveState.successEdit(EditLeaveResponseModel data) =
      _SuccessEdit;
  const factory LeaveState.successDelete(DeleteResponseModel data) =
      _SuccessDelete;
  const factory LeaveState.failed(String message) = _Failed;
}
