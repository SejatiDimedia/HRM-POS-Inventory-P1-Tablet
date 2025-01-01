import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/dashboard_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/today_attendance_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_attendance_event.dart';
part 'today_attendance_state.dart';
part 'today_attendance_bloc.freezed.dart';

class TodayAttendanceBloc
    extends Bloc<TodayAttendanceEvent, TodayAttendanceState> {
  final DashboardRemoteDataSource dataSource;
  TodayAttendanceBloc(this.dataSource) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getTodayAttendances();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(
          _Success(r.data ?? []),
        ),
      );
    });
  }
}
