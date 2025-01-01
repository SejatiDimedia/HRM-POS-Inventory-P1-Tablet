import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/leave/leave_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/leave_type/leave_type_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/staff/staff_bloc.dart';

import '../../../core/core.dart';
import '../../../data/models/response/leave_reasponse_model.dart';
import '../dialogs/add_new_leave.dart';
import '../dialogs/delete_dialog.dart';
import '../dialogs/edit_leave.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/pagination_widget.dart';

class LeavesPage extends StatefulWidget {
  const LeavesPage({super.key});

  @override
  State<LeavesPage> createState() => _LeavesPageState();
}

class _LeavesPageState extends State<LeavesPage> {
  bool isEmptyData = false;
  bool isAddForm = true;
  Leave? leavesModel;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  late List<Leave> searchResult;

  @override
  void initState() {
    //searchResult = leaves;
    context.read<LeaveBloc>().add(const LeaveEvent.fetch());
    context.read<LeaveTypeBloc>().add(const LeaveTypeEvent.fetch());
    context.read<StaffBloc>().add(const StaffEvent.fetch());
    super.initState();
  }

  void showEndDrawer(bool isAdd, [Leave? item]) {
    setState(() {
      isAddForm = isAdd;
      leavesModel = item;
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  Widget endDrawerWidget() {
    if (isAddForm) {
      return const AddNewLeave();
    }
    return EditLeave(item: leavesModel!);
  }

  String labelStatus(String status) {
    switch (status) {
      case 'pending':
        return 'Pending';
      case 'approved':
        return 'Approve';
      case 'rejected':
        return 'Rejected';
      default:
        return 'Status Not Found!';
    }
  }

  Color colorStatus(String status) {
    switch (status) {
      case 'pending':
        return AppColors.yellow;
      case 'approved':
        return AppColors.green;
      case 'rejected':
        return AppColors.red;
      default:
        return AppColors.gray;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: endDrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Leaves'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: SearchInput(
                        controller: searchController,
                        hintText: 'Quick search..',
                        onChanged: (value) {
                          // searchResult = leaves
                          //     .where((element) => element.user
                          //         .toLowerCase()
                          //         .contains(
                          //             searchController.text.toLowerCase()))
                          //     .toList();
                          // setState(() {});
                        },
                      ),
                    ),
                    const SpaceWidth(16.0),
                    Button.filled(
                      onPressed: () => showEndDrawer(true),
                      label: 'Add New Leave',
                      fontSize: 14.0,
                      width: 250.0,
                    ),
                  ],
                ),
              ),
              BlocBuilder<LeaveBloc, LeaveState>(
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
                                        const DataColumn(
                                            label: Text('User Name')),
                                        const DataColumn(
                                            label: Text('Leave Type')),
                                        const DataColumn(
                                            label: Text('Start Date')),
                                        const DataColumn(
                                            label: Text('End Date')),
                                        const DataColumn(label: Text('Status')),
                                        const DataColumn(label: Text('Reason')),
                                        const DataColumn(label: Text('')),
                                      ],
                                      rows: data.isEmpty
                                          ? [
                                              const DataRow(
                                                cells: [
                                                  DataCell(Row(
                                                    children: [
                                                      Icon(Icons.highlight_off),
                                                      SpaceWidth(4.0),
                                                      Text(
                                                          'Data tidak ditemukan..'),
                                                    ],
                                                  )),
                                                  DataCell.empty,
                                                  DataCell.empty,
                                                  DataCell.empty,
                                                  DataCell.empty,
                                                  DataCell.empty,
                                                  DataCell.empty,
                                                  DataCell.empty,
                                                ],
                                              ),
                                            ]
                                          : data
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.black,
                                                    ),
                                                  )),
                                                  DataCell(Text(
                                                      item.leaveType?.name ??
                                                          '')),
                                                  DataCell(Text(item.startDate
                                                          ?.toFormattedDate() ??
                                                      '')),
                                                  DataCell(Text(
                                                      '${item.endDate?.toFormattedDate() ?? ''} ${item.isHalfDay == true ? '(Half Day)' : ''}')),
                                                  DataCell(Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 4.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                          color:
                                                              AppColors.stroke),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Badge(
                                                          backgroundColor:
                                                              colorStatus(
                                                                  item.status ??
                                                                      ''),
                                                        ),
                                                        const SpaceWidth(8.0),
                                                        Text(labelStatus(
                                                            item.status ?? '')),
                                                      ],
                                                    ),
                                                  )),
                                                  DataCell(
                                                      Text(item.reason ?? '-')),
                                                  DataCell(Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: () =>
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return BlocConsumer<
                                                                      LeaveBloc,
                                                                      LeaveState>(
                                                                    listener:
                                                                        (context,
                                                                            state) {
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
                                                                          successDelete: (data) {
                                                                            context.pop();
                                                                          });
                                                                    },
                                                                    builder:
                                                                        (context,
                                                                            state) {
                                                                      return state
                                                                          .maybeWhen(
                                                                        orElse:
                                                                            () {
                                                                          return DeleteDialog(
                                                                            onConfirmTap:
                                                                                () {
                                                                              context.read<LeaveBloc>().add(LeaveEvent.delete(item.id!));
                                                                            },
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  );
                                                                }),
                                                        icon: const Icon(Icons
                                                            .delete_outline),
                                                      ),
                                                      IconButton(
                                                        onPressed: () =>
                                                            showEndDrawer(
                                                                false, item),
                                                        icon: const Icon(Icons
                                                            .edit_outlined),
                                                      ),
                                                    ],
                                                  )),
                                                ]),
                                              )
                                              .toList(),
                                    ),
                                  ),
                                ),
                                if (data.isNotEmpty)
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
