import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/payroll_remote_data_source.dart';

import '../../../../../data/models/response/delete_response_model.dart';

part 'delete_payroll_bloc.freezed.dart';
part 'delete_payroll_event.dart';
part 'delete_payroll_state.dart';

class DeletePayrollBloc extends Bloc<DeletePayrollEvent, DeletePayrollState> {
  final PayrollRemoteDataSource dataSource;
  DeletePayrollBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Delete>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.deletePayroll(event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_Success(r));
        },
      );
    });
  }
}
