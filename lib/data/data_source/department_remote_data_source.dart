import 'package:flutter_hrm_inventory_pos_app/data/models/request/department_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/add_department_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/delete_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/department_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/edit_department_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import 'auth_local_data_source.dart';
import 'base_error_response_model.dart';

class DepartmentRemoteDataSource {
  Future<Either<String, DepartmentResponseModel>> getDepartments() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}'
    };
    const path = '/api/departments';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(DepartmentResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, AddDepartmentResponseModel>> addDepartments(
      DepartmentRequestModel dataRequest) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    const path = '/api/departments';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.post(
      url,
      headers: headers,
      body: dataRequest.toJson(),
    );

    if (response.statusCode == 201) {
      return right(AddDepartmentResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, EditDepartmentResponseModel>> editDepartments(
      DepartmentRequestModel dataRequest, int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    final path = '/api/departments/$id';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.put(
      url,
      headers: headers,
      body: dataRequest.toJson(),
    );

    if (response.statusCode == 200) {
      return right(EditDepartmentResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, DeleteResponseModel>> deleteDepartments(int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };
    final path = '/api/departments/$id';
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
