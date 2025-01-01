part of 'designation_bloc.dart';

@freezed
class DesignationEvent with _$DesignationEvent {
  const factory DesignationEvent.started() = _Started;
  const factory DesignationEvent.fetch() = _Fetch;
  const factory DesignationEvent.addNewDesignation(Designation newDesignation) =
      _AddNewDesignation;
  const factory DesignationEvent.add(DesignationRequestModel dataRequest) =
      _Add;
  const factory DesignationEvent.edit(
      DesignationRequestModel dataRequest, int id) = _Edit;
  const factory DesignationEvent.updateDesignation(
      Designation updatedDesignation) = _UpdateDesignation;
  const factory DesignationEvent.delete(int id) = _Delete;
}
