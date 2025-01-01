part of 'generate_payroll_bloc.dart';

@freezed
class GeneratePayrollState with _$GeneratePayrollState {
  const factory GeneratePayrollState.initial() = _Initial;
  const factory GeneratePayrollState.loading() = _Loading;
  const factory GeneratePayrollState.success(List<Payroll> data) = _Success;
  const factory GeneratePayrollState.failed(String message) = _Failed;
}
