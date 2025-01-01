import 'package:flutter_hrm_inventory_pos_app/data/models/response/permission_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import 'auth_local_data_source.dart';
import 'base_error_response_model.dart';

class PermissionRemoteDataSource {
  Future<Either<String, PermissionResponseModel>> getPermissions() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}'
    };
    const path = '/api/permissions';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(PermissionResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }

  Future<Either<String, PermissionResponseModel>> getPermissionsByModule(
      String moduleName) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authData!.accessToken}'
    };
    final path = '/api/permissions?module_name=$moduleName';
    final url = Uri.parse('${Variables.baseUrl}$path');
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(PermissionResponseModel.fromJson(response.body));
    } else {
      final errorModel = baseErrorResponseModelFromJson(response.body);
      return left(errorModel.error);
    }
  }
}
