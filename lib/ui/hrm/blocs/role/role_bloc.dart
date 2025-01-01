// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/role_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/role_permission_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/role_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/role_response_model.dart';

import '../../../../data/models/response/add_role_response_model.dart';
import '../../../../data/models/response/delete_response_model.dart';
import '../../../../data/models/response/edit_role_permission_response_model.dart';

part 'role_bloc.freezed.dart';
part 'role_event.dart';
part 'role_state.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  final RoleRemoteDataSource dataSource;
  RoleBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    List<Role> roles = [];

    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getRoles();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          roles = r.roles ?? [];
          emit(_Success(r.roles ?? []));
        },
      );
    });

    on<_AddNewRole>((event, emit) async {
      roles = [event.newRole, ...roles];
      emit(_Success(roles));
    });

    on<_Add>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.addRoles(event.dataRequest);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_SuccessAdd(r)),
      );
    });

    on<_Edit>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.editRoles(event.dataRequest, event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_SuccessEdit(r));
        },
      );
    });

    on<_UpdateRole>((event, emit) async {
      final index = roles
          .indexWhere((designation) => designation.id == event.updatedRole.id);
      if (index != -1) {
        roles[index] = event.updatedRole;
        emit(_Success(roles));
      }
    });

    on<_Delete>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.deleteRoles(event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          roles.removeWhere((designation) => designation.id == event.id);
          emit(_SuccessDelete(r));
          emit(_Success(roles));
        },
      );
    });
  }
}
