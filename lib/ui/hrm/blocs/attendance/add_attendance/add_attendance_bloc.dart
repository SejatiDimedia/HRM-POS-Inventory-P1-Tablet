import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/attendance_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/attendance_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/add_attendance_response_model.dart';

part 'add_attendance_bloc.freezed.dart';
part 'add_attendance_event.dart';
part 'add_attendance_state.dart';

class AddAttendanceBloc extends Bloc<AddAttendanceEvent, AddAttendanceState> {
  final AttendanceRemoteDataSource dataSource;
  AddAttendanceBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Add>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.addAttendance(event.dataRequest);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
