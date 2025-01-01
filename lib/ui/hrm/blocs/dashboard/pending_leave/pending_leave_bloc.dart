import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/dashboard_remote_data_source.dart';

import '../../../../../data/models/response/pending_leave_response_model.dart';

part 'pending_leave_bloc.freezed.dart';
part 'pending_leave_event.dart';
part 'pending_leave_state.dart';

class PendingLeaveBloc extends Bloc<PendingLeaveEvent, PendingLeaveState> {
  final DashboardRemoteDataSource dataSource;
  PendingLeaveBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getPendingLeaves();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(
          _Success(r.data ?? []),
        ),
      );
    });
  }
}
