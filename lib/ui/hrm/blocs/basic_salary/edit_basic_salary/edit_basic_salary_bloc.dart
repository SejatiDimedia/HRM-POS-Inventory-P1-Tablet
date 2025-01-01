import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/basic_salary_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/basic_salary_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/edit_basic_salary_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_basic_salary_event.dart';
part 'edit_basic_salary_state.dart';
part 'edit_basic_salary_bloc.freezed.dart';

class EditBasicSalaryBloc
    extends Bloc<EditBasicSalaryEvent, EditBasicSalaryState> {
  final BasicSalaryRemoteDataSource dataSource;
  EditBasicSalaryBloc(this.dataSource) : super(const _Initial()) {
    on<_Edit>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.editBasicSalary(event.id, event.data);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_Success(r));
        },
      );
    });
  }
}
