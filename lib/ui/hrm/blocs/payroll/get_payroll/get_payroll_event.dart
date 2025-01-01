part of 'get_payroll_bloc.dart';

@freezed
class GetPayrollEvent with _$GetPayrollEvent {
  const factory GetPayrollEvent.started() = _Started;
  const factory GetPayrollEvent.fetch() = _Fetch;
  const factory GetPayrollEvent.searchByNameMontYear(
      String name, int month, int year) = _SearchByNameMontYear;
  const factory GetPayrollEvent.searchByName(String name) = _SearchByName;
}
