part of 'get_basic_salary_bloc.dart';

@freezed
class GetBasicSalaryState with _$GetBasicSalaryState {
  const factory GetBasicSalaryState.initial() = _Initial;
  const factory GetBasicSalaryState.loading() = _Loading;
  const factory GetBasicSalaryState.success(List<BasicSalary> data) = _Success;
  const factory GetBasicSalaryState.failed(String message) = _Failed;
}
