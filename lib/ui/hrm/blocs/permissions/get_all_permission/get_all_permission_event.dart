part of 'get_all_permission_bloc.dart';

@freezed
class GetAllPermissionEvent with _$GetAllPermissionEvent {
  const factory GetAllPermissionEvent.started() = _Started;
  const factory GetAllPermissionEvent.fetch() = _Fetch;
}
