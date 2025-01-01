part of 'delete_payroll_bloc.dart';

@freezed
class DeletePayrollState with _$DeletePayrollState {
  const factory DeletePayrollState.initial() = _Initial;
  const factory DeletePayrollState.loading() = _Loading;
  const factory DeletePayrollState.success(DeleteResponseModel data) = _Success;
  const factory DeletePayrollState.failed(String message) = _Failed;
}
