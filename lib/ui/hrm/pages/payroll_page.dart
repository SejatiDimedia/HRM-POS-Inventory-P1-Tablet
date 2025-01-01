import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/generate_payroll_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/payroll_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/payroll/generate_payroll/generate_payroll_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/payroll/get_payroll/get_payroll_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/staff/staff_bloc.dart';

import '../../../core/components/custom_month_year_picker.dart';
import '../../../core/core.dart';
import '../../../data/models/response/auth_response_model.dart';
import '../blocs/payroll/delete_payroll/delete_payroll_bloc.dart';
import '../dialogs/delete_dialog.dart';
import '../dialogs/edit_payroll.dart';
import '../dialogs/payroll_detail.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/pagination_widget.dart';
import 'basic_salary_page.dart';

class PayrollPage extends StatefulWidget {
  const PayrollPage({super.key});

  @override
  State<PayrollPage> createState() => _PayrollPageState();
}

class _PayrollPageState extends State<PayrollPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isNavigateToBasicSalaryPage = false;
  bool isEmptyData = false;
  bool isDetailPayroll = true;
  Payroll? payrollModel;
  User? selectedUser;

  late final TextEditingController monthYearPickedController;

  @override
  void initState() {
    monthYearPickedController = TextEditingController();
    //context.read<GetPayrollBloc>().add(const GetPayrollEvent.fetch());
    _fetchPayrolls();
    context.read<StaffBloc>().add(const StaffEvent.fetch());
    super.initState();
  }

  void _fetchPayrolls() {
    final monthYearText = monthYearPickedController.text.trim();
    final isMonthYearEmpty = monthYearText.isEmpty;
    final isUserSelected = selectedUser != null;

    if (isUserSelected && isMonthYearEmpty) {
      context.read<GetPayrollBloc>().add(
            GetPayrollEvent.searchByName(selectedUser!.name!),
          );
    } else if (isUserSelected && !isMonthYearEmpty) {
      final month = monthYearText.split(' ')[0];
      final year = monthYearText.split(' ')[1];
      context.read<GetPayrollBloc>().add(
            GetPayrollEvent.searchByNameMontYear(
              selectedUser!.name!,
              month.toMonthNumber,
              int.parse(year),
            ),
          );
    } else {
      context.read<GetPayrollBloc>().add(const GetPayrollEvent.fetch());
    }
  }

  @override
  void dispose() {
    monthYearPickedController.dispose();
    super.dispose();
  }

  String labelStatus(String isGenerated) {
    switch (isGenerated) {
      case 'generated':
        return 'Generated';
      case 'paid':
        return 'Paid';
      default:
        return 'Not Generated';
    }
  }

  Color colorStatus(String isGenerated) {
    switch (isGenerated) {
      case 'generated':
        return AppColors.green;
      case 'paid':
        return AppColors.primary;
      default:
        return AppColors.red;
    }
  }

  void showEndDrawer(bool isDetail, [Payroll? item]) {
    if (isDetail && item == null) {
      // Mencegah penggunaan nilai null
      return;
    }
    setState(() {
      isDetailPayroll = isDetail;
      payrollModel = item;
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  Widget endDrawerWidget() {
    if (isDetailPayroll && payrollModel != null) {
      return PayrollDetail(
        data: payrollModel!,
      );
    }
    return const EditPayroll();
  }

  @override
  Widget build(BuildContext context) {
    if (_isNavigateToBasicSalaryPage) {
      return BasicSalarryPage(
          backTap: () => setState(() => _isNavigateToBasicSalaryPage = false));
    }
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: endDrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Payrolls'),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: const Icon(
            Icons.refresh_rounded,
            color: AppColors.white,
          ),
          onPressed: () {
            context.read<GetPayrollBloc>().add(const GetPayrollEvent.fetch());
          }),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  BlocConsumer<GeneratePayrollBloc, GeneratePayrollState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        failed: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                        success: (data) {
                          // context
                          //     .read<GetPayrollBloc>()
                          //     .add(const GetPayrollEvent.fetch());
                          _fetchPayrolls();
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Button.filled(
                            onPressed: () {
                              final month =
                                  monthYearPickedController.text.split(' ')[0];
                              final year =
                                  monthYearPickedController.text.split(' ')[1];
                              final dataRequest = GeneratePayrollRequestModel(
                                month: month.toMonthNumber,
                                year: int.parse(year),
                              );

                              if (month.isNotEmpty && year.isNotEmpty) {
                                context.read<GeneratePayrollBloc>().add(
                                    GeneratePayrollEvent.generate(dataRequest));
                              }
                            },
                            label: 'Generate',
                            icon: Assets.icons.huge.svg(),
                            width: 150.0,
                            fontSize: 14.0,
                            height: 45.0,
                          );
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 300.0,
                    child: BlocBuilder<StaffBloc, StaffState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => CustomDropdown(
                            value: '-',
                            items: const ['-'],
                            label: 'Select User',
                            showLabel: false,
                            onChanged: (value) {},
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          failed: (message) => Center(
                            child: Text(message),
                          ),
                          success: (data) {
                            //selectedRoleId = data.first;
                            return CustomDropdown<User>(
                              value: selectedUser ?? data.first,
                              items: data,
                              label: 'Select User',
                              showLabel: false,
                              onChanged: (value) {
                                setState(() {
                                  selectedUser = value;
                                });
                                _fetchPayrolls();
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SpaceWidth(12.0),
                  SizedBox(
                    width: 200.0,
                    child: CustomMonthYearPicker(
                      label: 'Month Year',
                      showLabel: false,
                      onMonthSelected: (value) {
                        monthYearPickedController.text =
                            value.getMonthYearName();
                        setState(() {});
                        _fetchPayrolls();
                      },
                    ),
                  ),
                ],
              ),
              const SpaceHeight(16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ColoredBox(
                  color: AppColors.primary.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 12.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.info_rounded,
                          color: AppColors.primary,
                        ),
                        const SpaceWidth(10.0),
                        const Expanded(
                          child: Text(
                            'If you want to generate payroll for an employee then first setup basic salary for that employee.',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SpaceWidth(10.0),
                        Button.filled(
                          onPressed: () => setState(
                              () => _isNavigateToBasicSalaryPage = true),
                          label: 'Basic Salary Setup',
                          fontSize: 12.0,
                          height: 40.0,
                          width: 180.0,
                          borderRadius: 8.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<GetPayrollBloc, GetPayrollState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    failed: (message) => Center(
                      child: Text(message),
                    ),
                    success: (data) {
                      if (data.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(70.0),
                          child: Center(
                            child: EmptyPlaceholder2(),
                          ),
                        );
                      } else {
                        return Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                      dataRowMinHeight: 30.0,
                                      dataRowMaxHeight: 60.0,
                                      columns: [
                                        DataColumn(
                                          label: SizedBox(
                                            height: 24.0,
                                            width: 24.0,
                                            child: Checkbox(
                                              value: false,
                                              onChanged: (value) {},
                                            ),
                                          ),
                                        ),
                                        const DataColumn(label: Text('User')),
                                        const DataColumn(
                                            label: Text('Net Salary')),
                                        const DataColumn(label: Text('Month')),
                                        const DataColumn(
                                            label: Text('Payment Date')),
                                        const DataColumn(label: Text('Status')),
                                        const DataColumn(label: Text('')),
                                      ],
                                      rows: data
                                          .map(
                                            (item) => DataRow(cells: [
                                              DataCell(
                                                SizedBox(
                                                  height: 24.0,
                                                  width: 24.0,
                                                  child: Checkbox(
                                                    value: false,
                                                    onChanged: (value) {},
                                                  ),
                                                ),
                                              ),
                                              DataCell(Text(
                                                item.user?.name ?? '-',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              )),
                                              DataCell(Text(item.netSalary
                                                      ?.currencyFormatRp ??
                                                  '-')),
                                              DataCell(
                                                  Text(item.month.toString())),
                                              DataCell(Text(item.paymentDate
                                                      ?.toFormattedDate() ??
                                                  '-')),
                                              DataCell(Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 4.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                  border: Border.all(
                                                      color: AppColors.stroke),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Badge(
                                                      backgroundColor:
                                                          colorStatus(
                                                              item.status!),
                                                    ),
                                                    const SpaceWidth(8.0),
                                                    Text(labelStatus(
                                                        item.status!)),
                                                  ],
                                                ),
                                              )),
                                              DataCell(Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () => showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          BlocListener<
                                                              DeletePayrollBloc,
                                                              DeletePayrollState>(
                                                        listener:
                                                            (context, state) {
                                                          state.maybeWhen(
                                                              orElse: () {},
                                                              failed:
                                                                  (message) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content: Text(
                                                                        message),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                  ),
                                                                );
                                                              },
                                                              success: (data) {
                                                                context
                                                                    .read<
                                                                        GetPayrollBloc>()
                                                                    .add(const GetPayrollEvent
                                                                        .fetch());
                                                                context.pop();
                                                              });
                                                        },
                                                        child: DeleteDialog(
                                                          onConfirmTap: () {
                                                            context
                                                                .read<
                                                                    DeletePayrollBloc>()
                                                                .add(DeletePayrollEvent
                                                                    .delete(item
                                                                        .id!));
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    icon: const Icon(
                                                        Icons.delete_outline),
                                                  ),
                                                  IconButton(
                                                    // onPressed: () =>
                                                    //     _scaffoldKey
                                                    //         .currentState
                                                    //         ?.openEndDrawer(),
                                                    onPressed: () =>
                                                        showEndDrawer(
                                                            true, item),
                                                    icon:
                                                        const Icon(Icons.info),
                                                  ),
                                                ],
                                              )),
                                            ]),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: PaginationWidget(),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
