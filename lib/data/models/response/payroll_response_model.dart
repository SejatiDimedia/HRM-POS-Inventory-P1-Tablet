import 'dart:convert';

import 'package:flutter_hrm_inventory_pos_app/data/models/response/auth_response_model.dart';

class PayrollResponseModel {
  final String? message;
  final List<Payroll>? payroll;

  PayrollResponseModel({
    this.message,
    this.payroll,
  });

  factory PayrollResponseModel.fromJson(String str) =>
      PayrollResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PayrollResponseModel.fromMap(Map<String, dynamic> json) =>
      PayrollResponseModel(
        message: json["message"],
        payroll: json["payroll"] == null
            ? []
            : List<Payroll>.from(
                json["payroll"]!.map((x) => Payroll.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "payroll": payroll == null
            ? []
            : List<dynamic>.from(payroll!.map((x) => x.toMap())),
      };
}

class Payroll {
  final int? id;
  final int? companyId;
  final int? userId;
  final int? month;
  final int? year;
  final double? basicSalary;
  final double? salaryAmount;
  final double? netSalary;
  final int? totalDays;
  final int? workingDays;
  final int? presentDays;
  final int? totalOfficeTime;
  final int? totalWorkedTime;
  final int? halfDays;
  final int? lateDays;
  final int? paidLeaves;
  final int? unpaidLeaves;
  final int? holidayCount;
  final DateTime? paymentDate;
  final String? status;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User? user;

  Payroll({
    this.id,
    this.companyId,
    this.userId,
    this.month,
    this.year,
    this.basicSalary,
    this.salaryAmount,
    this.netSalary,
    this.totalDays,
    this.workingDays,
    this.presentDays,
    this.totalOfficeTime,
    this.totalWorkedTime,
    this.halfDays,
    this.lateDays,
    this.paidLeaves,
    this.unpaidLeaves,
    this.holidayCount,
    this.paymentDate,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Payroll.fromJson(String str) => Payroll.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Payroll.fromMap(Map<String, dynamic> json) => Payroll(
        id: json["id"],
        companyId: json["company_id"],
        userId: json["user_id"],
        month: json["month"],
        year: json["year"],
        basicSalary: json["basic_salary"] != null
            ? double.tryParse(json["basic_salary"].toString())
            : null,
        salaryAmount: json["salary_amount"] != null
            ? double.tryParse(json["salary_amount"].toString())
            : null,
        netSalary: json["net_salary"] != null
            ? double.tryParse(json["net_salary"].toString())
            : null,
        totalDays: json["total_days"],
        workingDays: json["working_days"],
        presentDays: json["present_days"],
        totalOfficeTime: json["total_office_time"],
        totalWorkedTime: json["total_worked_time"],
        halfDays: json["half_days"],
        lateDays: json["late_days"],
        paidLeaves: json["paid_leaves"],
        unpaidLeaves: json["unpaid_leaves"],
        holidayCount: json["holiday_count"],
        paymentDate: json["payment_date"] == null
            ? null
            : DateTime.tryParse(json["payment_date"]),
        status: json["status"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "company_id": companyId,
        "user_id": userId,
        "month": month,
        "year": year,
        "basic_salary": basicSalary,
        "salary_amount": salaryAmount,
        "net_salary": netSalary,
        "total_days": totalDays,
        "working_days": workingDays,
        "present_days": presentDays,
        "total_office_time": totalOfficeTime,
        "total_worked_time": totalWorkedTime,
        "half_days": halfDays,
        "late_days": lateDays,
        "paid_leaves": paidLeaves,
        "unpaid_leaves": unpaidLeaves,
        "holiday_count": holidayCount,
        "payment_date":
            "${paymentDate?.year.toString().padLeft(4, '0')}-${paymentDate?.month.toString().padLeft(2, '0')}-${paymentDate?.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toMap(),
      };
}
