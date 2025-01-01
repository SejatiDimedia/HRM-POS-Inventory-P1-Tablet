import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/shift_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/shift/shift_bloc.dart';

import '../../../core/core.dart';
import '../dialogs/add_new_shift.dart';
import '../dialogs/delete_dialog.dart';
import '../dialogs/edit_shift.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/pagination_widget.dart';

class ShiftPage extends StatefulWidget {
  const ShiftPage({super.key});

  @override
  State<ShiftPage> createState() => _ShiftPageState();
}

class _ShiftPageState extends State<ShiftPage> {
  bool isEmptyData = false;
  bool isAddForm = true;
  Shift? shiftModel;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  late List<Shift> searchResult;

  @override
  void initState() {
    //searchResult = shifts;
    context.read<ShiftBloc>().add(const ShiftEvent.fetch());
    super.initState();
  }

  void showEndDrawer(bool isAdd, [Shift? item]) {
    setState(() {
      isAddForm = isAdd;
      shiftModel = item;
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  Widget endDrawerWidget() {
    if (isAddForm) {
      return const AddNewShift();
    }
    return EditShift(item: shiftModel!);
  }

  String formatTime(String time) {
    try {
      final parts = time.split(':');
      if (parts.length < 2) {
        throw const FormatException("Invalid time format");
      }

      final hour = parts[0].padLeft(2, '0');
      final minute = parts[1].padLeft(2, '0');

      return '$hour:$minute WIB';
    } catch (e) {
      return 'Invalid Time';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: endDrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Shift'),
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
                          // searchResult = shifts
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
                      label: 'Add New Shift',
                      fontSize: 14.0,
                      width: 250.0,
                    ),
                  ],
                ),
              ),
              BlocBuilder<ShiftBloc, ShiftState>(
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
                                        const DataColumn(label: Text('Name')),
                                        const DataColumn(
                                            label: Text('Clock In Time')),
                                        const DataColumn(
                                            label: Text('Clock Out Time')),
                                        const DataColumn(
                                            label: Text('Late Mark After')),
                                        const DataColumn(
                                            label: Text('Self Clocking')),
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
                                                    item.shiftName ?? '',
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.black,
                                                    ),
                                                  )),
                                                  DataCell(Text(formatTime(
                                                      item.clockInTime!))),
                                                  DataCell(Text(formatTime(
                                                      item.clockOutTime!))),
                                                  DataCell(Text(
                                                      '${item.lateMarkAfter} Minutes')),
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
                                                              item.selfClocking ==
                                                                      true
                                                                  ? AppColors
                                                                      .green
                                                                  : AppColors
                                                                      .red,
                                                        ),
                                                        const SpaceWidth(8.0),
                                                        Text(
                                                            item.selfClocking ==
                                                                    true
                                                                ? 'Yes'
                                                                : 'No'),
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
                                                              BlocConsumer<
                                                                  ShiftBloc,
                                                                  ShiftState>(
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
                                                                  successDelete:
                                                                      (data) {
                                                                    context
                                                                        .pop();
                                                                  });
                                                            },
                                                            builder: (context,
                                                                state) {
                                                              return state
                                                                  .maybeWhen(
                                                                orElse: () {
                                                                  return DeleteDialog(
                                                                    onConfirmTap:
                                                                        () {
                                                                      context
                                                                          .read<
                                                                              ShiftBloc>()
                                                                          .add(ShiftEvent.delete(
                                                                              item.id!));
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
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
