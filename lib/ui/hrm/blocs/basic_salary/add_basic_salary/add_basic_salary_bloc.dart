import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/basic_salary_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/basic_salary_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/add_basic_salary_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_basic_salary_event.dart';
part 'add_basic_salary_state.dart';
part 'add_basic_salary_bloc.freezed.dart';

class AddBasicSalaryBloc
    extends Bloc<AddBasicSalaryEvent, AddBasicSalaryState> {
  final BasicSalaryRemoteDataSource dataSource;
  AddBasicSalaryBloc(this.dataSource) : super(const _Initial()) {
    on<_Add>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.addBasicSalary(event.data);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
