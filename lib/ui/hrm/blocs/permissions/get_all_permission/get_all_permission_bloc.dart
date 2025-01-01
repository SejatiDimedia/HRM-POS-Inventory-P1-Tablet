import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/permission_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/permission_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_permission_event.dart';
part 'get_all_permission_state.dart';
part 'get_all_permission_bloc.freezed.dart';

class GetAllPermissionBloc
    extends Bloc<GetAllPermissionEvent, GetAllPermissionState> {
  final PermissionRemoteDataSource dataSource;
  GetAllPermissionBloc(this.dataSource) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getPermissions();

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r.permissions ?? [])),
      );
    });
  }
}
