part of 'add_basic_salary_bloc.dart';

@freezed
class AddBasicSalaryEvent with _$AddBasicSalaryEvent {
  const factory AddBasicSalaryEvent.started() = _Started;
  const factory AddBasicSalaryEvent.add(BasicSalaryRequestModel data) = _Add;
}
