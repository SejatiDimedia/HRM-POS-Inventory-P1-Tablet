// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/shift_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/shift_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/add_shift_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/edit_shift_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/shift_response_model.dart';

import '../../../../data/models/response/delete_response_model.dart';

part 'shift_bloc.freezed.dart';
part 'shift_event.dart';
part 'shift_state.dart';

class ShiftBloc extends Bloc<ShiftEvent, ShiftState> {
  final ShiftRemoteDataSource dataSource;
  ShiftBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    List<Shift> shifts = [];

    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getShifts();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          shifts = r.shifts ?? [];
          emit(_Success(r.shifts ?? []));
        },
      );
    });

    on<_AddNewShift>((event, emit) async {
      shifts = [event.newShift, ...shifts];
      emit(_Success(shifts));
    });

    on<_Add>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.addShift(event.dataRequest);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_SuccessAdd(r)),
      );
    });

    on<_Edit>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.editShift(event.dataRequest, event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_SuccessEdit(r));
        },
      );
    });

    on<_UpdateShift>((event, emit) async {
      final index =
          shifts.indexWhere((shift) => shift.id == event.updatedShift.id);
      if (index != -1) {
        shifts[index] = event.updatedShift;
        emit(_Success(shifts));
      }
    });

    on<_Delete>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.deleteShift(event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          shifts.removeWhere((shift) => shift.id == event.id);
          emit(_SuccessDelete(r));
          emit(_Success(shifts));
        },
      );
    });
  }
}
