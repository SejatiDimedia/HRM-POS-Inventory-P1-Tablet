part of 'role_bloc.dart';

@freezed
class RoleState with _$RoleState {
  const factory RoleState.initial() = _Initial;
  const factory RoleState.loading() = _Loading;
  const factory RoleState.success(List<Role> data) = _Success;
  const factory RoleState.successAdd(AddRoleResponseModel data) = _SuccessAdd;
  const factory RoleState.successEdit(EditRolePermissionResponseModel data) =
      _SuccessEdit;
  const factory RoleState.successDelete(DeleteResponseModel data) =
      _SuccessDelete;
  const factory RoleState.failed(String message) = _Failed;
}
