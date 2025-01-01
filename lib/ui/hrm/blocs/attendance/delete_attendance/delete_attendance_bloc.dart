import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/attendance_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/delete_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_attendance_event.dart';
part 'delete_attendance_state.dart';
part 'delete_attendance_bloc.freezed.dart';

class DeleteAttendanceBloc
    extends Bloc<DeleteAttendanceEvent, DeleteAttendanceState> {
  final AttendanceRemoteDataSource dataSource;
  DeleteAttendanceBloc(this.dataSource) : super(const _Initial()) {
    on<_Delete>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.deleteAttendance(event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_Success(r));
        },
      );
    });
  }
}
