part of 'designation_bloc.dart';

@freezed
class DesignationState with _$DesignationState {
  const factory DesignationState.initial() = _Initial;
  const factory DesignationState.loading() = _Loading;
  const factory DesignationState.success(List<Designation> data) = _Success;
  const factory DesignationState.successAdd(AddDesignationResponseModel data) =
      _SuccessAdd;
  const factory DesignationState.successEdit(
      EditDesignationResponseModel data) = _SuccessEdit;
  const factory DesignationState.successDelete(DeleteResponseModel data) =
      _SuccessDelete;
  const factory DesignationState.failed(String message) = _Failed;
}
