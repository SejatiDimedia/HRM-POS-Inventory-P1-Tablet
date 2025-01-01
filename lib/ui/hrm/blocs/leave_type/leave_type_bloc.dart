// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/leave_type_remote_data_source.dart';

import '../../../../data/models/response/leave_type_response_model.dart';

part 'leave_type_bloc.freezed.dart';
part 'leave_type_event.dart';
part 'leave_type_state.dart';

class LeaveTypeBloc extends Bloc<LeaveTypeEvent, LeaveTypeState> {
  final LeaveTypeRemoteDataSource dataSource;
  LeaveTypeBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    List<LeaveType> leaveTypes = [];

    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getLeaveTypes();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          leaveTypes = r.data ?? [];
          emit(_Success(r.data ?? []));
        },
      );
    });
  }
}
