import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/payroll_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/generate_payroll_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/response/payroll_response_model.dart';

part 'generate_payroll_event.dart';
part 'generate_payroll_state.dart';
part 'generate_payroll_bloc.freezed.dart';

class GeneratePayrollBloc
    extends Bloc<GeneratePayrollEvent, GeneratePayrollState> {
  final PayrollRemoteDataSource dataSource;
  GeneratePayrollBloc(this.dataSource) : super(const _Initial()) {
    on<_Generate>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.generate(event.dataRequest);

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(
          _Success(r.payrolls ?? []),
        ),
      );
    });
  }
}
