import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/attendance_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/attendance/delete_attendance/delete_attendance_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/attendance/get_attendance/get_attendance_bloc.dart';

import '../../../core/core.dart';
import '../blocs/staff/staff_bloc.dart';
import '../dialogs/add_new_attendance.dart';
import '../dialogs/delete_dialog.dart';
import '../dialogs/edit_attendance.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/pagination_widget.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  bool isEmptyData = false;
  bool isAddForm = true;
  Attendance? attendanceModel;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  late List<Attendance> searchResult;

  @override
  void initState() {
    //searchResult = attendances;
    context.read<GetAttendanceBloc>().add(const GetAttendanceEvent.fetch());
    context.read<StaffBloc>().add(const StaffEvent.fetch());
    super.initState();
  }

  void showEndDrawer(bool isAdd, [Attendance? item]) {
    setState(() {
      isAddForm = isAdd;
      attendanceModel = item;
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  Widget endDrawerWidget() {
    if (isAddForm) {
      return const AddNewAttendance();
    }
    return EditAttendance(item: attendanceModel!);
  }

  String labelStatus(Status status) {
    switch (status) {
      case Status.PRESENT:
        return 'Present';
      case Status.ABSENT:
        return 'Absent';
      case Status.NOT_MARKED:
        return 'Not Marked';
      case Status.LEAVE:
        return 'Leave';
      default:
        return 'Not Present';
    }
  }

  Color colorStatus(Status status) {
    switch (status) {
      case Status.PRESENT:
        return AppColors.green;
      case Status.ABSENT:
        return AppColors.yellow;
      case Status.NOT_MARKED:
        return AppColors.blue;
      case Status.LEAVE:
        return AppColors.primary;
      default:
        return AppColors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: endDrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Attendance'),
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
                          // searchResult = attendances
                          //     .where((element) => element.name
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
                      label: 'Add New Attendance',
                      fontSize: 14.0,
                      width: 250.0,
                    ),
                  ],
                ),
              ),
              BlocBuilder<GetAttendanceBloc, GetAttendanceState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    failed: (message) => Center(
                      child: Text(message),
                    ),
                    success: (attendance) {
                      if (attendance.isEmpty) {
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
                                            label: Text('Staff Member')),
                                        const DataColumn(label: Text('Date')),
                                        const DataColumn(
                                            label: Text('Clock In Time')),
                                        const DataColumn(
                                            label: Text('Clock Out Time')),
                                        const DataColumn(label: Text('Status')),
                                        const DataColumn(label: Text('')),
                                      ],
                                      rows: attendance.isEmpty
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
                                                ],
                                              ),
                                            ]
                                          : attendance
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
                                                    item.user!.name!,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.black,
                                                    ),
                                                  )),
                                                  DataCell(Text(item.date!
                                                      .toFormattedDate())),
                                                  DataCell(Text(item
                                                          .clockInDateTime
                                                          ?.toFormattedTime() ??
                                                      '')),
                                                  DataCell(Text(item
                                                          .clockOutDateTime
                                                          ?.toFormattedTime() ??
                                                      '')),
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
                                                        onPressed: () =>
                                                            showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              BlocListener<
                                                                  DeleteAttendanceBloc,
                                                                  DeleteAttendanceState>(
                                                            listener: (context,
                                                                state) {
                                                              state.maybeWhen(
                                                                  orElse: () {},
                                                                  failed:
                                                                      (message) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(message),
                                                                        backgroundColor:
                                                                            Colors.red,
                                                                      ),
                                                                    );
                                                                  },
                                                                  success:
                                                                      (data) {
                                                                    context
                                                                        .read<
                                                                            GetAttendanceBloc>()
                                                                        .add(const GetAttendanceEvent
                                                                            .fetch());
                                                                    context
                                                                        .pop();
                                                                  });
                                                            },
                                                            child: DeleteDialog(
                                                              onConfirmTap: () {
                                                                context
                                                                    .read<
                                                                        DeleteAttendanceBloc>()
                                                                    .add(DeleteAttendanceEvent
                                                                        .delete(
                                                                            item.id!));
                                                              },
                                                            ),
                                                          ),
                                                        ),
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
                                if (attendance.isNotEmpty)
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
