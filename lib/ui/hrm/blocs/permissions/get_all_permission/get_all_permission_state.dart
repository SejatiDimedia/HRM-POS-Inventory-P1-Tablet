part of 'get_all_permission_bloc.dart';

@freezed
class GetAllPermissionState with _$GetAllPermissionState {
  const factory GetAllPermissionState.initial() = _Initial;
  const factory GetAllPermissionState.loading() = _Loading;
  const factory GetAllPermissionState.success(List<Permission> dataList) =
      _Success;
  const factory GetAllPermissionState.failed(String message) = _Failed;
}
