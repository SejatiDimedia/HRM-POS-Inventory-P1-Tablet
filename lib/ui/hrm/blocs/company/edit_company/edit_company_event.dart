part of 'edit_company_bloc.dart';

@freezed
class EditCompanyEvent with _$EditCompanyEvent {
  const factory EditCompanyEvent.started() = _Started;
  const factory EditCompanyEvent.edit(CompanyRequestModel dataRequest) = _Edit;
}
