part of 'delete_payroll_bloc.dart';

@freezed
class DeletePayrollEvent with _$DeletePayrollEvent {
  const factory DeletePayrollEvent.started() = _Started;
  const factory DeletePayrollEvent.delete(int id) = _Delete;
}