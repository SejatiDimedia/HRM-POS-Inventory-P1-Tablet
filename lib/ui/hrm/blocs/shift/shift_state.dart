part of 'shift_bloc.dart';

@freezed
class ShiftState with _$ShiftState {
  const factory ShiftState.initial() = _Initial;
  const factory ShiftState.loading() = _Loading;
  const factory ShiftState.success(List<Shift> data) = _Success;
  const factory ShiftState.successAdd(AddShiftResponseModel data) = _SuccessAdd;
  const factory ShiftState.successEdit(EditShiftResponseModel data) =
      _SuccessEdit;
  const factory ShiftState.successDelete(DeleteResponseModel data) =
      _SuccessDelete;
  const factory ShiftState.failed(String message) = _Failed;
}
