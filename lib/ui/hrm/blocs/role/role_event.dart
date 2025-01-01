part of 'role_bloc.dart';

@freezed
class RoleEvent with _$RoleEvent {
  const factory RoleEvent.started() = _Started;
  const factory RoleEvent.fetch() = _Fetch;
  const factory RoleEvent.addNewRole(Role newRole) = _AddNewRole;
  const factory RoleEvent.add(RoleRequestModel dataRequest) = _Add;
  const factory RoleEvent.edit(RolePermissionRequestModel dataRequest, int id) =
      _Edit;
  const factory RoleEvent.updateRole(Role updatedRole) = _UpdateRole;
  const factory RoleEvent.delete(int id) = _Delete;
}
