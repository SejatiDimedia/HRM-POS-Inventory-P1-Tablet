part of 'get_payroll_detail_bloc.dart';

@freezed
class GetPayrollDetailState with _$GetPayrollDetailState {
  const factory GetPayrollDetailState.initial() = _Initial;
  const factory GetPayrollDetailState.loading() = _Loading;
  const factory GetPayrollDetailState.success(
      GetPayrollDetailResponseModel data) = _Success;
  const factory GetPayrollDetailState.failed(String message) = _Failed;
}
