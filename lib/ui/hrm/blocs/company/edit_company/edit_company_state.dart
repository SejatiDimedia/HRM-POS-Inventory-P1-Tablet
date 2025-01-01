part of 'edit_company_bloc.dart';

@freezed
class EditCompanyState with _$EditCompanyState {
  const factory EditCompanyState.initial() = _Initial;
  const factory EditCompanyState.loading() = _Loading;
  const factory EditCompanyState.success(CompanyResponseModel data) = _Success;
  const factory EditCompanyState.failed(String message) = _Failed;
}
