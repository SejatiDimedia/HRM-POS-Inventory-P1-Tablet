part of 'edit_basic_salary_bloc.dart';

@freezed
class EditBasicSalaryEvent with _$EditBasicSalaryEvent {
  const factory EditBasicSalaryEvent.started() = _Started;
  const factory EditBasicSalaryEvent.edit(
      int id, BasicSalaryRequestModel data) = _Edit;
}
