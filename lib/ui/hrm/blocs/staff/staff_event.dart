part of 'staff_bloc.dart';

@freezed
class StaffEvent with _$StaffEvent {
  const factory StaffEvent.started() = _Started;
  const factory StaffEvent.fetch() = _Fetch;
  const factory StaffEvent.addNewStaff(User newStaff) = _AddNewStaff;
  const factory StaffEvent.add(
      User staff, XFile? photoProfile, String password) = _Add;
  const factory StaffEvent.edit(
      User staff, XFile? photoProfile, String password, int id) = _Edit;
  const factory StaffEvent.updateStaff(User updatedStaff) = _UpdateStaff;
  const factory StaffEvent.delete(int id) = _Delete;
}
