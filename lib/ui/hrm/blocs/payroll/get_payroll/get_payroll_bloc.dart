import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/payroll_remote_data_source.dart';

import '../../../../../data/models/response/payroll_response_model.dart';

part 'get_payroll_bloc.freezed.dart';
part 'get_payroll_event.dart';
part 'get_payroll_state.dart';

class GetPayrollBloc extends Bloc<GetPayrollEvent, GetPayrollState> {
  final PayrollRemoteDataSource dataSource;
  GetPayrollBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getPayrolls();

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r.payroll ?? [])),
      );
    });

    on<_SearchByNameMontYear>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getPayrollByNameMonthYear(
        event.name,
        event.month,
        event.year,
      );

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r.payroll ?? [])),
      );
    });

    on<_SearchByName>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getPayrollByName(event.name);

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r.payroll ?? [])),
      );
    });
  }
}
