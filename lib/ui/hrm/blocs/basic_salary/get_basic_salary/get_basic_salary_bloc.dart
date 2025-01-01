import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/basic_salary_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/response/basic_sallaries_response_model.dart';

part 'get_basic_salary_event.dart';
part 'get_basic_salary_state.dart';
part 'get_basic_salary_bloc.freezed.dart';

class GetBasicSalaryBloc
    extends Bloc<GetBasicSalaryEvent, GetBasicSalaryState> {
  final BasicSalaryRemoteDataSource dataSource;
  GetBasicSalaryBloc(this.dataSource) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getBasicSalary();

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r.data ?? [])),
      );
    });
  }
}
