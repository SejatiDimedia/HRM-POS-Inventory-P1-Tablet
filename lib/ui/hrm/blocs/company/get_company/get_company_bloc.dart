import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_hrm_inventory_pos_app/data/data_source/company_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/company_response_model.dart';

part 'get_company_bloc.freezed.dart';
part 'get_company_event.dart';
part 'get_company_state.dart';

class GetCompanyBloc extends Bloc<GetCompanyEvent, GetCompanyState> {
  final CompanyRemoteDataSource dataSource;
  GetCompanyBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());

      final response = await dataSource.getCompany();

      response.fold(
        (l) => emit(_Failed(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
