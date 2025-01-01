import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/department_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/add_department_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/delete_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/edit_department_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/department_remote_data_source.dart';

import '../../../../data/models/response/department_response_model.dart';

part 'department_bloc.freezed.dart';
part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final DepartmentRemoteDataSource dataSource;
  DepartmentBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    List<Department> departments = [];

    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getDepartments();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          departments = r.departments ?? [];
          emit(_Success(r.departments ?? []));
        },
      );
    });

    on<_AddNewDepart>((event, emit) async {
      departments = [event.newDepart, ...departments];
      emit(_Success(departments));
    });

    on<_Add>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.addDepartments(event.dataRequest);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_SuccessAdd(r)),
      );
    });

    on<_Edit>((event, emit) async {
      emit(const _Loading());

      final response =
          await dataSource.editDepartments(event.dataRequest, event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_SuccessEdit(r));
        },
      );
    });

    on<_UpdateDepartment>((event, emit) async {
      final index = departments
          .indexWhere((depart) => depart.id == event.updatedDepartment.id);
      if (index != -1) {
        departments[index] = event.updatedDepartment;
        emit(_Success(departments));
      }
    });

    on<_Delete>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.deleteDepartments(event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          departments.removeWhere((depart) => depart.id == event.id);
          emit(_SuccessDelete(r));
          emit(_Success(departments));
        },
      );
    });
  }
}
