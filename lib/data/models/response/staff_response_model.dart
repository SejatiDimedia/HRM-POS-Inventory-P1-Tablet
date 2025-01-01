import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/auth_response_model.dart';

class StaffResponseModel {
  final String? message;
  final List<User>? data;

  StaffResponseModel({
    this.message,
    this.data,
  });

  factory StaffResponseModel.fromJson(String str) =>
      StaffResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StaffResponseModel.fromMap(Map<String, dynamic> json) =>
      StaffResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<User>.from(json["data"]!.map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}



// enum ShiftName { MORNING, NIGHT, EVENING }

// final shiftNameValues = EnumValues({
//   "Morning": ShiftName.MORNING,
//   "Night": ShiftName.NIGHT,
//   "Evening": ShiftName.EVENING,
// });

// enum Status { DISABLE, ENABLE }

// final statusValues =
//     EnumValues({"Disable": Status.DISABLE, "Enable": Status.ENABLE});

// enum UserType { CUSTOMER, EMPLOYEE }

// final userTypeValues =
//     EnumValues({"customer": UserType.CUSTOMER, "employee": UserType.EMPLOYEE});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
