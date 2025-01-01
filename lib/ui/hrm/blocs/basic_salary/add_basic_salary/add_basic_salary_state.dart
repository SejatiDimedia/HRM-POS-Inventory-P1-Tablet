part of 'add_basic_salary_bloc.dart';

@freezed
class AddBasicSalaryState with _$AddBasicSalaryState {
  const factory AddBasicSalaryState.initial() = _Initial;
  const factory AddBasicSalaryState.loading() = _Loading;
  const factory AddBasicSalaryState.success(
      AddBasicSalaryResponseModel basicSalary) = _Success;
  const factory AddBasicSalaryState.failed(String message) = _Failed;
}
