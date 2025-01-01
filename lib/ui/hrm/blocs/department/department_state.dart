part of 'department_bloc.dart';

@freezed
class DepartmentState with _$DepartmentState {
  const factory DepartmentState.initial() = _Initial;
  const factory DepartmentState.loading() = _Loading;
  const factory DepartmentState.success(List<Department> data) = _Success;
  const factory DepartmentState.successAdd(AddDepartmentResponseModel data) =
      _SuccessAdd;
  const factory DepartmentState.successEdit(EditDepartmentResponseModel data) =
      _SuccessEdit;
  const factory DepartmentState.successDelete(DeleteResponseModel data) =
      _SuccessDelete;
  const factory DepartmentState.failed(String message) = _Failed;
}
