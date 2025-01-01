import 'package:flutter_hrm_inventory_pos_app/data/models/response/holidays_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../models/request/holiday_request_model.dart';
import '../models/response/add_Holiday_response_model.dart';
import '../models/response/delete_response_model.dart';
import '../models/response/edit_holiday_response_model.dart';
import 'auth_local_data_source.dart';
import 'base_error_response_model.dart';

class HolidayRemoteDataSource {
  Future<Either<String, HolidaysResponseModel>> getHolidays() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}'
    };
    const path = '/api/holidays';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(HolidaysResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, AddHolidayResponseModel>> addHoliday(
      HolidayRequestModel dataRequest) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    const path = '/api/holidays';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.post(
      url,
      headers: headers,
      body: dataRequest.toJson(),
    );

    if (response.statusCode == 201) {
      return right(AddHolidayResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, EditHolidayResponseModel>> editHoliday(
      HolidayRequestModel dataRequest, int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
      'Content-type': 'application/json',
    };
    final path = '/api/holidays/$id';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.put(
      url,
      headers: headers,
      body: dataRequest.toJson(),
    );

    if (response.statusCode == 200) {
      return right(EditHolidayResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, DeleteResponseModel>> deleteHoliday(int id) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}',
    };
    final path = '/api/holidays/$id';
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
