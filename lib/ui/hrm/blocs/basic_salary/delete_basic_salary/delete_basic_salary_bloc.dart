import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/basic_salary_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/response/delete_response_model.dart';

part 'delete_basic_salary_event.dart';
part 'delete_basic_salary_state.dart';
part 'delete_basic_salary_bloc.freezed.dart';

class DeleteBasicSalaryBloc
    extends Bloc<DeleteBasicSalaryEvent, DeleteBasicSalaryState> {
  final BasicSalaryRemoteDataSource dataSource;
  DeleteBasicSalaryBloc(this.dataSource) : super(const _Initial()) {
    on<_Delete>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.deleteBasicSalary(event.id);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_Success(r));
        },
      );
    });
  }
}
