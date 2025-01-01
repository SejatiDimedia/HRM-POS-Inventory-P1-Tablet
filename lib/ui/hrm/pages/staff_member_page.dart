import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/auth_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/department/department_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/designation/designation_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/role/role_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/shift/shift_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/staff/staff_bloc.dart';

import '../../../core/core.dart';
import '../dialogs/add_new_staff_member.dart';
import '../dialogs/delete_dialog.dart';
import '../dialogs/edit_new_staff_member.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/pagination_widget.dart';

class StaffMemberPage extends StatefulWidget {
  const StaffMemberPage({super.key});

  @override
  State<StaffMemberPage> createState() => _StaffMemberPageState();
}

class _StaffMemberPageState extends State<StaffMemberPage> {
  bool isEmptyData = false;
  bool isAddForm = true;
  User? selectedMember;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  late List<User> searchResult;

  @override
  void initState() {
    //searchResult = staffMembers;
    context.read<StaffBloc>().add(const StaffEvent.fetch());
    context.read<RoleBloc>().add(const RoleEvent.fetch());
    context.read<DepartmentBloc>().add(const DepartmentEvent.fetch());
    context.read<DesignationBloc>().add(const DesignationEvent.fetch());
    context.read<ShiftBloc>().add(const ShiftEvent.fetch());
    super.initState();
  }

  void showEndDrawer(bool isAdd, [User? item]) {
    setState(() {
      isAddForm = isAdd;
      selectedMember = item;
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  Widget endDrawerWidget() {
    if (isAddForm) {
      return const AddNewStaffMember();
    }
    return EditStaffMember(item: selectedMember!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: endDrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Staff Member'),
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
                          // searchResult = staffMembers
                          //     .where((element) => element.name
                          //         .toLowerCase()
                          //         .contains(
                          //             searchController.text.toLowerCase()))
                          //     .toList();
                          setState(() {});
                        },
                      ),
                    ),
                    const SpaceWidth(16.0),
                    Button.filled(
                      onPressed: () => showEndDrawer(true),
                      label: 'Add New Staff Member',
                      fontSize: 14.0,
                      width: 250.0,
                    ),
                  ],
                ),
              ),
              BlocBuilder<StaffBloc, StaffState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    failed: (message) => Center(
                      child: Text(message),
                    ),
                    success: (staffList) {
                      if (staffList.isEmpty) {
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
                                        const DataColumn(label: Text('Shift')),
                                        const DataColumn(label: Text('Status')),
                                        const DataColumn(
                                            label: Text('Departement')),
                                        const DataColumn(
                                            label: Text('Email address')),
                                        const DataColumn(
                                            label: Text('Designation')),
                                        const DataColumn(label: Text('')),
                                      ],
                                      rows: staffList.isEmpty
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
                                          : staffList
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
                                                  DataCell(ListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    title:
                                                        Text(item.name ?? ''),
                                                    titleTextStyle:
                                                        const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.black,
                                                    ),
                                                    subtitle: Text(
                                                        item.username ?? ''),
                                                    leading: ClipOval(
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            "${Variables.baseUrlImage}/${item.profileImage}",
                                                        height: 40.0,
                                                        width: 40.0,
                                                        fit: BoxFit.cover,
                                                        placeholder:
                                                            (context, url) =>
                                                                const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(
                                                          Icons.image,
                                                          color:
                                                              AppColors.primary,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                                  DataCell(Text(
                                                      item.shift?.shiftName ??
                                                          '-')),
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
                                                          backgroundColor: item
                                                                      .status!
                                                                      .toLowerCase() ==
                                                                  'enable'
                                                              ? AppColors.green
                                                              : AppColors.red,
                                                        ),
                                                        const SpaceWidth(8.0),
                                                        Text(item.status ?? ''),
                                                      ],
                                                    ),
                                                  )),
                                                  DataCell(Text(item.department
                                                          ?.departmentName ??
                                                      '-')),
                                                  DataCell(
                                                      Text(item.email ?? '')),
                                                  DataCell(Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 4.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      border: Border.all(
                                                          color:
                                                              AppColors.stroke),
                                                      color: AppColors.light,
                                                    ),
                                                    child: Text(item.designation
                                                            ?.designationName ??
                                                        '-'),
                                                  )),
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
                                                                      StaffBloc,
                                                                      StaffState>(
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
                                                                              context.read<StaffBloc>().add(StaffEvent.delete(item.id!));
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
                                if (staffList.isNotEmpty)
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
