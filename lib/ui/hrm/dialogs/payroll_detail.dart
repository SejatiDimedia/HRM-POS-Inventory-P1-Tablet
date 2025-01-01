import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/payroll_response_model.dart';

import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/payroll/get_payroll_detail/get_payroll_detail_bloc.dart';

import '../../../core/core.dart';

class PayrollDetail extends StatefulWidget {
  final Payroll data;
  const PayrollDetail({
    super.key,
    required this.data,
  });

  @override
  State<PayrollDetail> createState() => _PayrollDetailState();
}

class _PayrollDetailState extends State<PayrollDetail> {
  @override
  void initState() {
    context
        .read<GetPayrollDetailBloc>()
        .add(GetPayrollDetailEvent.fetchDetail(widget.data.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth - 600.0,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Detail Payroll',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: BlocBuilder<GetPayrollDetailBloc, GetPayrollDetailState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              failed: (message) => Center(
                child: Text(message),
              ),
              success: (item) {
                return ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Card(
                      color: AppColors.primary,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Month',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    const SpaceHeight(4.0),
                                    Text(
                                      item.payroll!.month!.monthName,
                                      style: const TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SpaceWidth(30.0),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Net Salary',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    const SpaceHeight(4.0),
                                    Text(
                                      item.payroll!.netSalary!.currencyFormatRp,
                                      style: const TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SpaceHeight(12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Text(
                            'Summary',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const Divider(),
                        _LabelValue(
                            'Total Days', item.payroll!.totalDays.toString()),
                        const Divider(),
                        _LabelValue('Working Days',
                            item.payroll!.workingDays.toString()),
                        const Divider(),
                        _LabelValue('Present Days',
                            item.payroll!.presentDays.toString()),
                        const Divider(),
                        _LabelValue('Total Office Time',
                            '${item.payroll!.totalOfficeTime} mins'),
                        const Divider(),
                        _LabelValue('Total Worked Time',
                            '${item.payroll!.totalWorkedTime} mins'),
                        const Divider(),
                        _LabelValue(
                            'Half Days', item.payroll!.halfDays.toString()),
                        const Divider(),
                        _LabelValue(
                            'Late Days', item.payroll!.lateDays.toString()),
                        const Divider(),
                        _LabelValue('Basic Salary',
                            item.payroll!.basicSalary!.currencyFormatRp),
                        const Divider(),
                        const SpaceHeight(24.0),
                        const ColoredBox(
                          color: AppColors.background,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 24.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('Sallary Component'),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text('Value'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        _LabelValue(
                            'Salary Amount',
                            item.payroll!.salaryAmount?.currencyFormatRp ??
                                '0'),
                        const Divider(),
                        const _LabelValue('Deductions', '31'),
                        const Divider(),
                        _LabelValue('Expense Claim', 0.currencyFormatRp),
                        const Divider(),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _LabelValue extends StatelessWidget {
  final String label;
  final String value;
  const _LabelValue(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
