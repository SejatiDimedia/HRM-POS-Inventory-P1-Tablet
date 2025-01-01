// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/holiday_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/holidays_response_model.dart';

import '../../../../data/models/request/holiday_request_model.dart';
import '../../../../data/models/response/add_Holiday_response_model.dart';
import '../../../../data/models/response/delete_response_model.dart';
import '../../../../data/models/response/edit_holiday_response_model.dart';

part 'holiday_bloc.freezed.dart';
part 'holiday_event.dart';
part 'holiday_state.dart';

class HolidayBloc extends Bloc<HolidayEvent, HolidayState> {
  final HolidayRemoteDataSource dataSource;
  HolidayBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    List<Holiday> holidays = [];

    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getHolidays();
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          holidays = r.data ?? [];
          emit(_Success(r.data ?? []));
        },
      );
    });

    on<_AddNewHoliday>((event, emit) async {
      holidays = [event.newHoliday, ...holidays];
      emit(_Success(holidays));
    });

    on<_Add>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.addHoliday(event.dataRequest);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_SuccessAdd(r)),
      );
    });

    on<_Edit>((event, emit) async {
      emit(const _Loading());

      final response =
          await dataSource.editHoliday(event.dataRequest, event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_SuccessEdit(r));
        },
      );
    });

    on<_UpdateHoliday>((event, emit) async {
      final index = holidays
          .indexWhere((holiday) => holiday.id == event.updatedHoliday.id);
      if (index != -1) {
        holidays[index] = event.updatedHoliday;
        emit(_Success(holidays));
      }
    });

    on<_Delete>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.deleteHoliday(event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          holidays.removeWhere((holiday) => holiday.id == event.id);
          emit(_SuccessDelete(r));
          emit(_Success(holidays));
        },
      );
    });
  }
}
