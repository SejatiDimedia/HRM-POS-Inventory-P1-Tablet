class PayrollModel {
  final String user;
  final double netSallary;
  final String month;
  final DateTime paymentDate;
  final bool isGenerate;

  PayrollModel({
    required this.user,
    required this.netSallary,
    required this.month,
    required this.paymentDate,
    required this.isGenerate,
  });
}

final payrolls = [
  PayrollModel(
    user: 'Fauzan',
    netSallary: 1000000000,
    month: 'Agustus 2024',
    paymentDate: DateTime.now(),
    isGenerate: true,
  ),
  PayrollModel(
    user: 'Fauzan',
    netSallary: 1000000000,
    month: 'Agustus 2024',
    paymentDate: DateTime.now(),
    isGenerate: true,
  ),
  PayrollModel(
    user: 'Fauzan',
    netSallary: 1000000000,
    month: 'Agustus 2024',
    paymentDate: DateTime.now(),
    isGenerate: false,
  ),
  PayrollModel(
    user: 'Fauzan',
    netSallary: 1000000000,
    month: 'Agustus 2024',
    paymentDate: DateTime.now(),
    isGenerate: false,
  ),
];
