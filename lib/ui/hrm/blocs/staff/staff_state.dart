part of 'staff_bloc.dart';

@freezed
class StaffState with _$StaffState {
  const factory StaffState.initial() = _Initial;
  const factory StaffState.loading() = _Loading;
  const factory StaffState.success(List<User> staffList) = _Success;
  const factory StaffState.successAdd(AddStaffResponseModel data) = _SuccessAdd;
  const factory StaffState.successEdit(EditStaffResponseModel data) =
      _SuccessEdit;
  const factory StaffState.successDelete(DeleteResponseModel data) =
      _SuccessDelete;
  const factory StaffState.failed(String message) = _Failed;
}
