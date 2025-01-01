import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/dashboard_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/today_summary_response_model.dart';

part 'today_summary_bloc.freezed.dart';
part 'today_summary_event.dart';
part 'today_summary_state.dart';

class TodaySummaryBloc extends Bloc<TodaySummaryEvent, TodaySummaryState> {
  final DashboardRemoteDataSource dataSource;
  TodaySummaryBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getTodaySummary();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(
          _Success(r.data!),
        ),
      );
    });
  }
}
