import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/attendance_remote_data_source.dart';

import '../../../../../data/models/response/attendance_response_model.dart';

part 'get_attendance_bloc.freezed.dart';
part 'get_attendance_event.dart';
part 'get_attendance_state.dart';

class GetAttendanceBloc extends Bloc<GetAttendanceEvent, GetAttendanceState> {
  final AttendanceRemoteDataSource dataSource;
  GetAttendanceBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getAttendance();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_Success(r.attendance ?? []));
        },
      );
    });
  }
}
