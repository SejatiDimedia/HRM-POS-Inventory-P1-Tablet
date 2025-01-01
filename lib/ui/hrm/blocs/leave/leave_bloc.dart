// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/leave_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/leave_reasponse_model.dart';

import '../../../../data/models/request/leave_request_model.dart';
import '../../../../data/models/response/add_leave_response_model.dart';
import '../../../../data/models/response/delete_response_model.dart';
import '../../../../data/models/response/edit_leave_response_model.dart';

part 'leave_bloc.freezed.dart';
part 'leave_event.dart';
part 'leave_state.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  final LeaveRemoteDataSource dataSource;
  LeaveBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    List<Leave> leaves = [];

    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getLeaves();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          leaves = r.data ?? [];
          emit(_Success(r.data ?? []));
        },
      );
    });

    on<_AddNewLeave>((event, emit) async {
      leaves = [event.newLeave, ...leaves];
      emit(_Success(leaves));
    });

    on<_Add>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.addLeave(event.dataRequest);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_SuccessAdd(r)),
      );
    });

    on<_Edit>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.editLeave(event.dataRequest, event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_SuccessEdit(r));
        },
      );
    });

    on<_UpdateLeave>((event, emit) async {
      final index =
          leaves.indexWhere((shift) => shift.id == event.updatedLeave.id);
      if (index != -1) {
        leaves[index] = event.updatedLeave;
        emit(_Success(leaves));
      }
    });

    on<_Delete>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.deleteLeave(event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          leaves.removeWhere((shift) => shift.id == event.id);
          emit(_SuccessDelete(r));
          emit(_Success(leaves));
        },
      );
    });
  }
}
