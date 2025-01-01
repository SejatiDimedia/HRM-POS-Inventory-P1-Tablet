part of 'generate_payroll_bloc.dart';

@freezed
class GeneratePayrollEvent with _$GeneratePayrollEvent {
  const factory GeneratePayrollEvent.started() = _Started;
  const factory GeneratePayrollEvent.generate(
      GeneratePayrollRequestModel dataRequest) = _Generate;
}
