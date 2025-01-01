import 'package:flutter_hrm_inventory_pos_app/data/models/request/designation_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/add_designation_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/edit_designation_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../models/response/delete_response_model.dart';
import '../models/response/designation_response_model.dart';
import 'auth_local_data_source.dart';
import 'base_error_response_model.dart';

class DesignationRemoteDataSource {
  Future<Either<String, DesignationResponseModel>> getDesignation() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}'
    };
    const path = '/api/designations';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(DesignationResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, AddDesignationResponseModel>> addDesignation(
      DesignationRequestModel dataRequest) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    const path = '/api/designations';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.post(
      url,
      headers: headers,
      body: dataRequest.toJson(),
    );

    if (response.statusCode == 201) {
      return right(AddDesignationResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, EditDesignationResponseModel>> editDesignations(
      DesignationRequestModel dataRequest, int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    final path = '/api/designations/$id';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.put(
      url,
      headers: headers,
      body: dataRequest.toJson(),
    );

    if (response.statusCode == 200) {
      return right(EditDesignationResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, DeleteResponseModel>> deleteDesignations(int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };
    final path = '/api/designations/$id';
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
