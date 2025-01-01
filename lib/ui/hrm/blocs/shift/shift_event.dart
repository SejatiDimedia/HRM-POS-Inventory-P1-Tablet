part of 'shift_bloc.dart';

@freezed
class ShiftEvent with _$ShiftEvent {
  const factory ShiftEvent.started() = _Started;
  const factory ShiftEvent.fetch() = _Fetch;
  const factory ShiftEvent.addNewShift(Shift newShift) = _AddNewShift;
  const factory ShiftEvent.add(ShiftRequestModel dataRequest) = _Add;
  const factory ShiftEvent.edit(ShiftRequestModel dataRequest, int id) = _Edit;
  const factory ShiftEvent.updateShift(Shift updatedShift) = _UpdateShift;
  const factory ShiftEvent.delete(int id) = _Delete;
}
