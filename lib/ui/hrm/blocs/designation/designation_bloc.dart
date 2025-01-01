// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/designation_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/designation_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/add_designation_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/designation_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/edit_designation_response_model.dart';

import '../../../../data/models/response/delete_response_model.dart';

part 'designation_bloc.freezed.dart';
part 'designation_event.dart';
part 'designation_state.dart';

class DesignationBloc extends Bloc<DesignationEvent, DesignationState> {
  final DesignationRemoteDataSource dataSource;
  DesignationBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    List<Designation> designations = [];

    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getDesignation();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          designations = r.designations ?? [];
          emit(_Success(r.designations ?? []));
        },
      );
    });

    on<_AddNewDesignation>((event, emit) async {
      designations = [event.newDesignation, ...designations];
      emit(_Success(designations));
    });

    on<_Add>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.addDesignation(event.dataRequest);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_SuccessAdd(r)),
      );
    });

    on<_Edit>((event, emit) async {
      emit(const _Loading());

      final response =
          await dataSource.editDesignations(event.dataRequest, event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_SuccessEdit(r));
        },
      );
    });

    on<_UpdateDesignation>((event, emit) async {
      final index = designations.indexWhere(
          (designation) => designation.id == event.updatedDesignation.id);
      if (index != -1) {
        designations[index] = event.updatedDesignation;
        emit(_Success(designations));
      }
    });

    on<_Delete>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.deleteDesignations(event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          designations.removeWhere((designation) => designation.id == event.id);
          emit(_SuccessDelete(r));
          emit(_Success(designations));
        },
      );
    });
  }
}
