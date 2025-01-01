import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class StaffRequestModel {
  final String username;
  // final bool? isSuperadmin;
  final int? warehouseId;
  final int roleId;
  // final String? userType;
  // final bool? loginEnabled;
  final String name;
  final String email;
  final String password;
  final String phone;
  final XFile? profileImage;
  final String? address;
  final String? status;
  final int departmentId;
  final int designationId;
  final int shiftId;
  StaffRequestModel({
    required this.username,
    //this.isSuperadmin,
    this.warehouseId,
    required this.roleId,
    // this.userType,
    // this.loginEnabled,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.profileImage,
    this.address,
    this.status,
    required this.departmentId,
    required this.designationId,
    required this.shiftId,
  });

  Map<String, String> toMap() {
    return {
      'username': username,
      //'isSuperadmin': isSuperadmin,
      'warehouse_id': warehouseId.toString(),
      'role_id': roleId.toString(),
      //'userType': userType,
      //'loginEnabled': loginEnabled,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      //'profileImage': profileImage?.toMap(),
      'address': address ?? '',
      'status': status!,
      'department_id': departmentId.toString(),
      'designation_id': designationId.toString(),
      'shift_id': shiftId.toString(),
    };
  }

  factory StaffRequestModel.fromMap(Map<String, dynamic> map) {
    return StaffRequestModel(
      username: map['username'] as String,
      //isSuperadmin:
      //    map['isSuperadmin'] != null ? map['isSuperadmin'] as bool : null,
      warehouseId:
          map['warehouse_id'] != null ? map['warehouse_id'] as int : null,
      roleId: map['role_id'] as int,
      // userType: map['userType'] != null ? map['userType'] as String : null,
      // loginEnabled:
      //    map['loginEnabled'] != null ? map['loginEnabled'] as bool : null,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
      //profileImage: map['profileImage'] != null ? File.fromMap(map['profileImage'] as Map<String,dynamic>) : null,
      address: map['address'] != null ? map['address'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      departmentId: map['department_id'] as int,
      designationId: map['designation_id'] as int,
      shiftId: map['shift_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StaffRequestModel.fromJson(String source) =>
      StaffRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
