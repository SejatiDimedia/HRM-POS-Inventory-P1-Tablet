import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/staff_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/add_staff_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/edit_staff_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/staff_remote_data_source.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/models/response/auth_response_model.dart';
import '../../../../data/models/response/delete_response_model.dart';

part 'staff_bloc.freezed.dart';
part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  final StaffRemoteDataSource dataSource;
  StaffBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    List<User> users = [];

    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getStaffList();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          users = r.data ?? [];
          emit(_Success(r.data ?? []));
        },
      );
    });

    on<_AddNewStaff>((event, emit) async {
      users = [event.newStaff, ...users];
      emit(_Success(users));
    });

    on<_Add>((event, emit) async {
      emit(const _Loading());

      final requestData = StaffRequestModel(
        username: event.staff.username ?? '',
        warehouseId: 1,
        roleId: event.staff.roleId ?? 0,
        name: event.staff.name ?? '',
        email: event.staff.email ?? '',
        password: event.password,
        phone: event.staff.phone ?? '',
        address: event.staff.address ?? '',
        status: event.staff.status ?? '',
        departmentId: event.staff.departmentId ?? 0,
        designationId: event.staff.designationId ?? 0,
        shiftId: event.staff.shiftId ?? 0,
        profileImage: event.photoProfile,
      );

      final response = await dataSource.addStaff(requestData);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_SuccessAdd(r)),
      );
    });

    on<_Edit>((event, emit) async {
      emit(const _Loading());

      final requestData = StaffRequestModel(
        username: event.staff.username ?? '',
        warehouseId: 1,
        roleId: event.staff.roleId ?? 0,
        name: event.staff.name ?? '',
        email: event.staff.email ?? '',
        password: event.password,
        phone: event.staff.phone ?? '',
        address: event.staff.address ?? '',
        status: event.staff.status ?? '',
        departmentId: event.staff.departmentId ?? 0,
        designationId: event.staff.designationId ?? 0,
        shiftId: event.staff.shiftId ?? 0,
        profileImage: event.photoProfile,
      );

      final response = await dataSource.editStaff(requestData, event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_SuccessEdit(r));
        },
      );
    });

    on<_UpdateStaff>((event, emit) async {
      final index = users
          .indexWhere((designation) => designation.id == event.updatedStaff.id);
      if (index != -1) {
        users[index] = event.updatedStaff;
        emit(_Success(users));
      }
    });

    on<_Delete>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.deleteStaff(event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          users.removeWhere((designation) => designation.id == event.id);
          emit(_SuccessDelete(r));
          emit(_Success(users));
        },
      );
    });
  }
}
