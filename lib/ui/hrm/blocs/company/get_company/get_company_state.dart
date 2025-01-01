part of 'get_company_bloc.dart';

@freezed
class GetCompanyState with _$GetCompanyState {
  const factory GetCompanyState.initial() = _Initial;
  const factory GetCompanyState.loading() = _Loading;
  const factory GetCompanyState.success(CompanyResponseModel data) = _Success;
  const factory GetCompanyState.failed(String message) = _Failed;
}
