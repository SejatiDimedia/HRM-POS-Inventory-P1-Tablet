part of 'get_payroll_detail_bloc.dart';

@freezed
class GetPayrollDetailEvent with _$GetPayrollDetailEvent {
  const factory GetPayrollDetailEvent.started() = _Started;
  const factory GetPayrollDetailEvent.fetchDetail(int id) = _FetchDetail;
}
