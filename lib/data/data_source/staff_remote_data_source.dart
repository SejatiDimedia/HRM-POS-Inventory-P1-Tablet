import 'package:flutter_hrm_inventory_pos_app/data/data_source/auth_local_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_source/base_error_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/staff_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/add_staff_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/edit_staff_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/staff_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../models/response/delete_response_model.dart';

class StaffRemoteDataSource {
  Future<Either<String, StaffResponseModel>> getStaffList() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}'
    };
    const path = '/api/staff';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(StaffResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, AddStaffResponseModel>> addStaff(
      StaffRequestModel requestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}'
    };
    const path = '/api/staff';
    final url = Uri.parse('${Variables.baseUrl}$path');
    var request = http.MultipartRequest(
      'POST',
      url,
    );

    request.fields.addAll(requestModel.toMap());

    if (requestModel.profileImage != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'profile_image',
        requestModel.profileImage!.path,
      ));
    }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final String body = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      return right(AddStaffResponseModel.fromJson(body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, EditStaffResponseModel>> editStaff(
      StaffRequestModel requestModel, int staffId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}'
    };
    final path = '/api/staff/$staffId';
    final url = Uri.parse('${Variables.baseUrl}$path');
    var request = http.MultipartRequest('POST', url);

    request.fields.addAll(requestModel.toMap());
    if (requestModel.profileImage != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'profile_image',
        requestModel.profileImage!.path,
      ));
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final String body = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return right(EditStaffResponseModel.fromJson(body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, DeleteResponseModel>> deleteStaff(int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };
    final path = '/api/staff/$id';
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
