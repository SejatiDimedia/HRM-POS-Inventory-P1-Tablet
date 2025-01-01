import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/payroll_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/get_payroll_detail_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_payroll_detail_event.dart';
part 'get_payroll_detail_state.dart';
part 'get_payroll_detail_bloc.freezed.dart';

class GetPayrollDetailBloc
    extends Bloc<GetPayrollDetailEvent, GetPayrollDetailState> {
  final PayrollRemoteDataSource dataSource;
  GetPayrollDetailBloc(this.dataSource) : super(const _Initial()) {
    on<_FetchDetail>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getPayrollDetail(event.id);

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
