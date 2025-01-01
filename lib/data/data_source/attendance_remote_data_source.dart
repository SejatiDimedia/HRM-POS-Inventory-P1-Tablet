import 'package:flutter_hrm_inventory_pos_app/data/models/request/attendance_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../models/response/add_attendance_response_model.dart';
import '../models/response/attendance_response_model.dart';
import '../models/response/delete_response_model.dart';
import '../models/response/edit_attendance_response_model.dart';
import 'auth_local_data_source.dart';
import 'base_error_response_model.dart';

class AttendanceRemoteDataSource {
  Future<Either<String, AttendanceResponseModel>> getAttendance() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}'
    };
    const path = '/api/attendances';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(AttendanceResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, AddAttendanceResponseModel>> addAttendance(
      AttendanceRequestModel dataRequest) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    const path = '/api/attendances';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.post(
      url,
      headers: headers,
      body: dataRequest.toJson(),
    );

    if (response.statusCode == 201) {
      return right(AddAttendanceResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, EditAttendanceResponseModel>> editAttendance(
      AttendanceRequestModel dataRequest, int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    final path = '/api/attendances/$id';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.put(
      url,
      headers: headers,
      body: dataRequest.toJson(),
    );

    if (response.statusCode == 200) {
      return right(EditAttendanceResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, DeleteResponseModel>> deleteAttendance(int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };
    final path = '/api/attendances/$id';
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
