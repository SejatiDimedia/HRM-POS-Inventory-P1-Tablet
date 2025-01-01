import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/role_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/role/role_bloc.dart';

import '../../../core/core.dart';
import '../dialogs/add_new_role.dart';
import '../dialogs/delete_dialog.dart';
import '../dialogs/edit_permission_user.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/pagination_widget.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  bool isEmptyData = false;
  bool isAddForm = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  late List<Role> searchResult;
  Role? selectRole;

  @override
  void initState() {
    //searchResult = userManagements;
    context.read<RoleBloc>().add(const RoleEvent.fetch());
    super.initState();
  }

  void showEndDrawer(bool isAdd, [Role? item]) {
    setState(() {
      isAddForm = isAdd;
      selectRole = item;
    });
    // delete condition when UI add role is available
    if (!isAdd) {
      _scaffoldKey.currentState?.openEndDrawer();
    }
  }

  Widget endDrawerWidget() {
    if (isAddForm) {
      return const SizedBox.shrink();
    }
    return EditPermissionUser(item: selectRole ?? Role());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: endDrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'User Management'),
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
                          // searchResult = userManagements
                          //     .where((element) => element.roleName
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
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const AddNewRole(),
                      ),
                      label: 'Add New Role',
                      fontSize: 14.0,
                      width: 200.0,
                    ),
                  ],
                ),
              ),
              BlocBuilder<RoleBloc, RoleState>(
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
                                            label: Text('Role Name')),
                                        const DataColumn(
                                            label: Text('Description')),
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
                                                      item.roleName ?? '')),
                                                  DataCell(Text(
                                                      item.description ?? '')),
                                                  DataCell(Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: () =>
                                                            showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              BlocConsumer<
                                                                  RoleBloc,
                                                                  RoleState>(
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
                                                                              RoleBloc>()
                                                                          .add(RoleEvent.delete(
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
