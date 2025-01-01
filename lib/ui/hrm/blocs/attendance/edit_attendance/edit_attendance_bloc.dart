import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/attendance_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/request/attendance_request_model.dart';
import '../../../../../data/models/response/edit_attendance_response_model.dart';

part 'edit_attendance_event.dart';
part 'edit_attendance_state.dart';
part 'edit_attendance_bloc.freezed.dart';

class EditAttendanceBloc
    extends Bloc<EditAttendanceEvent, EditAttendanceState> {
  final AttendanceRemoteDataSource dataSource;
  EditAttendanceBloc(this.dataSource) : super(const _Initial()) {
    on<_Edit>((event, emit) async {
      emit(const _Loading());

      final response =
          await dataSource.editAttendance(event.dataRequest, event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_Success(r));
        },
      );
    });
  }
}
