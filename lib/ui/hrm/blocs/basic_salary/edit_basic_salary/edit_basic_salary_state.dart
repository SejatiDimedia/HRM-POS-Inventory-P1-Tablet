part of 'edit_basic_salary_bloc.dart';

@freezed
class EditBasicSalaryState with _$EditBasicSalaryState {
  const factory EditBasicSalaryState.initial() = _Initial;
  const factory EditBasicSalaryState.loading() = _Loading;
  const factory EditBasicSalaryState.success(
      EditBasicSalaryResponseModel basicSalary) = _Success;
  const factory EditBasicSalaryState.failed(String message) = _Failed;
}
