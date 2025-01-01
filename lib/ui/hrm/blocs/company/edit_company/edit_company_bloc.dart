import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/company_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/company_request_model.dart';

import '../../../../../data/models/response/company_response_model.dart';

part 'edit_company_bloc.freezed.dart';
part 'edit_company_event.dart';
part 'edit_company_state.dart';

class EditCompanyBloc extends Bloc<EditCompanyEvent, EditCompanyState> {
  final CompanyRemoteDataSource dataSource;
  EditCompanyBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Edit>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.editCompany(event.dataRequest);
      response.fold(
        (l) => emit(_Failed(l)),
        (r) {
          emit(_Success(r));
        },
      );
    });
  }
}
