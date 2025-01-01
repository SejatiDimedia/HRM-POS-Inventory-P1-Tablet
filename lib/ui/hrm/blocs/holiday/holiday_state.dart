part of 'holiday_bloc.dart';

@freezed
class HolidayState with _$HolidayState {
  const factory HolidayState.initial() = _Initial;
  const factory HolidayState.loading() = _Loading;
  const factory HolidayState.success(List<Holiday> data) = _Success;
  const factory HolidayState.successAdd(AddHolidayResponseModel data) =
      _SuccessAdd;
  const factory HolidayState.successEdit(EditHolidayResponseModel data) =
      _SuccessEdit;
  const factory HolidayState.successDelete(DeleteResponseModel data) =
      _SuccessDelete;
  const factory HolidayState.failed(String message) = _Failed;
}
