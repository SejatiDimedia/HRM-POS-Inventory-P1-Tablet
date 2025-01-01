part of 'holiday_bloc.dart';

@freezed
class HolidayEvent with _$HolidayEvent {
  const factory HolidayEvent.started() = _Started;
  const factory HolidayEvent.fetch() = _Fetch;
  const factory HolidayEvent.addNewHoliday(Holiday newHoliday) = _AddNewHoliday;
  const factory HolidayEvent.add(HolidayRequestModel dataRequest) = _Add;
  const factory HolidayEvent.edit(HolidayRequestModel dataRequest, int id) =
      _Edit;
  const factory HolidayEvent.updateHoliday(Holiday updatedHoliday) =
      _UpdateHoliday;
  const factory HolidayEvent.delete(int id) = _Delete;
}
