part of 'get_payroll_bloc.dart';

@freezed
class GetPayrollState with _$GetPayrollState {
  const factory GetPayrollState.initial() = _Initial;
  const factory GetPayrollState.loading() = _Loading;
  const factory GetPayrollState.success(List<Payroll> data) = _Success;
  const factory GetPayrollState.failed(String message) = _Failed;
}
