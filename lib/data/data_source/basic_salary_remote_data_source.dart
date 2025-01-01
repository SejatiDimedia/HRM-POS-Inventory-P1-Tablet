import 'package:flutter_hrm_inventory_pos_app/data/models/request/basic_salary_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/add_basic_salary_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/basic_sallaries_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/edit_basic_salary_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../core/core.dart';

import '../models/response/delete_response_model.dart';
import 'auth_local_data_source.dart';
import 'base_error_response_model.dart';

class BasicSalaryRemoteDataSource {
  Future<Either<String, BasicSalariesResponseModel>> getBasicSalary() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}'
    };
    const path = '/api/basic-salaries';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(BasicSalariesResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, AddBasicSalaryResponseModel>> addBasicSalary(
      BasicSalaryRequestModel dataRequest) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    const path = '/api/basic-salaries';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.post(
      url,
      headers: headers,
      body: dataRequest.toJson(),
    );

    if (response.statusCode == 201) {
      return right(AddBasicSalaryResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, EditBasicSalaryResponseModel>> editBasicSalary(
      int id, BasicSalaryRequestModel dataRequest) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    final path = '/api/basic-salaries/$id';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.put(
      url,
      headers: headers,
      body: dataRequest.toJson(),
    );

    if (response.statusCode == 200) {
      return right(EditBasicSalaryResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, DeleteResponseModel>> deleteBasicSalary(int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };
    final path = '/api/basic-salaries/$id';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.delete(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(DeleteResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }
}
