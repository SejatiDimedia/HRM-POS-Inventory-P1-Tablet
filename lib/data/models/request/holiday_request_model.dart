import 'dart:convert';

class HolidayRequestModel {
  final String? name;
  final int? year;
  final int? month;
  final DateTime? date;
  final bool? isWeekend;

  HolidayRequestModel({
    this.name,
    this.year,
    this.month,
    this.date,
    this.isWeekend,
  });

  factory HolidayRequestModel.fromJson(String str) =>
      HolidayRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HolidayRequestModel.fromMap(Map<String, dynamic> json) =>
      HolidayRequestModel(
        name: json["name"],
        year: json["year"],
        month: json["month"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        isWeekend: json["is_weekend"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "year": year,
        "month": month,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "is_weekend": isWeekend,
      };
}
