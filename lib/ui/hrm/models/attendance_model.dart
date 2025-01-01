enum AttendanceStatus {
  present,
  onLeave;

  bool get isPresent => this == AttendanceStatus.present;
  bool get isOnLeave => this == AttendanceStatus.onLeave;
}

class AttendanceModel {
  final String name;
  final DateTime date;
  final DateTime clockInTime;
  final DateTime clockOutTime;
  final bool isLate;
  final bool isHalfDay;
  final AttendanceStatus status;

  AttendanceModel({
    required this.name,
    required this.date,
    required this.clockInTime,
    required this.clockOutTime,
    required this.isLate,
    required this.isHalfDay,
    required this.status,
  });
}

final attendances = [
  AttendanceModel(
    name: 'Olivia Rhye',
    date: DateTime.now(),
    clockInTime: DateTime.now().subtract(const Duration(minutes: 12)),
    clockOutTime: DateTime.now(),
    isLate: true,
    isHalfDay: false,
    status: AttendanceStatus.present,
  ),
  AttendanceModel(
    name: 'Andi Wijaya',
    date: DateTime.now(),
    clockInTime: DateTime.now().subtract(const Duration(minutes: 10)),
    clockOutTime: DateTime.now(),
    isLate: false,
    isHalfDay: true,
    status: AttendanceStatus.present,
  ),
  AttendanceModel(
    name: 'Budi Santoso',
    date: DateTime.now(),
    clockInTime: DateTime.now().subtract(const Duration(minutes: 21)),
    clockOutTime: DateTime.now(),
    isLate: false,
    isHalfDay: false,
    status: AttendanceStatus.onLeave,
  ),
];
