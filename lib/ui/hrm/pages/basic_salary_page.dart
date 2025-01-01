import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/basic_salary/get_basic_salary/get_basic_salary_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/staff/staff_bloc.dart';

import '../../../core/core.dart';
import '../../../data/models/response/auth_response_model.dart';
import '../blocs/basic_salary/delete_basic_salary/delete_basic_salary_bloc.dart';
import '../dialogs/add_new_basic_salary.dart';
import '../dialogs/delete_dialog.dart';
import '../dialogs/edit_basic_salary.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/pagination_widget.dart';

class BasicSalarryPage extends StatefulWidget {
  final VoidCallback backTap;
  const BasicSalarryPage({super.key, required this.backTap});

  @override
  State<BasicSalarryPage> createState() => _BasicSalarryPageState();
}

class _BasicSalarryPageState extends State<BasicSalarryPage> {
  bool isEmptyData = false;

  // final users = ['All User', 'Fauzan', 'Fauzan Abdillah'];
  // final userSelectedController = TextEditingController();
  User? selectedUser;

  @override
  void initState() {
    //userSelectedController.text = users.first;
    context.read<StaffBloc>().add(const StaffEvent.fetch());
    context.read<GetBasicSalaryBloc>().add(const GetBasicSalaryEvent.fetch());
    super.initState();
  }

  @override
  void dispose() {
    //userSelectedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Basic Salary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: widget.backTap,
                  label: const Text('Back'),
                  icon: const Icon(Icons.chevron_left),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button.filled(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const AddNewBasicSalary(),
                      ),
                      label: 'Add New Basic Salary',
                      fontSize: 14.0,
                      width: 250.0,
                    ),
                    SizedBox(
                      width: 400.0,
                      child: BlocBuilder<StaffBloc, StaffState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => CustomDropdown(
                              value: '-',
                              items: const ['-'],
                              label: 'Select User',
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
                                onChanged: (value) {
                                  setState(() {
                                    selectedUser = value;
                                  });
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<GetBasicSalaryBloc, GetBasicSalaryState>(
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
                                            label: Text('Basic Salary')),
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
                                                item.user?.name ?? '',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              )),
                                              DataCell(Text(double.parse(
                                                      item.basicSalary!)
                                                  .currencyFormatRp)),
                                              DataCell(Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () => showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          BlocListener<
                                                              DeleteBasicSalaryBloc,
                                                              DeleteBasicSalaryState>(
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
                                                                        GetBasicSalaryBloc>()
                                                                    .add(const GetBasicSalaryEvent
                                                                        .fetch());
                                                                context.pop();
                                                              });
                                                        },
                                                        child: DeleteDialog(
                                                          onConfirmTap: () {
                                                            context
                                                                .read<
                                                                    DeleteBasicSalaryBloc>()
                                                                .add(DeleteBasicSalaryEvent
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
                                                    onPressed: () => showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          EditBasicSalary(
                                                        item: item,
                                                      ),
                                                    ),
                                                    icon: const Icon(
                                                        Icons.edit_outlined),
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
