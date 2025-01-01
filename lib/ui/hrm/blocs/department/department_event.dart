part of 'department_bloc.dart';

@freezed
class DepartmentEvent with _$DepartmentEvent {
  const factory DepartmentEvent.started() = _Started;
  const factory DepartmentEvent.fetch() = _Fetch;
  const factory DepartmentEvent.addNewDepart(Department newDepart) =
      _AddNewDepart;
  const factory DepartmentEvent.add(DepartmentRequestModel dataRequest) = _Add;
  const factory DepartmentEvent.edit(
      DepartmentRequestModel dataRequest, int id) = _Edit;
  const factory DepartmentEvent.updateDepartment(Department updatedDepartment) =
      _UpdateDepartment;
  const factory DepartmentEvent.delete(int id) = _Delete;
}
