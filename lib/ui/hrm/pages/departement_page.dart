import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/department_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/department/department_bloc.dart';

import '../../../core/core.dart';
import '../dialogs/add_new_departement.dart';
import '../dialogs/delete_dialog.dart';
import '../dialogs/edit_departement.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/pagination_widget.dart';

class DepartementPage extends StatefulWidget {
  const DepartementPage({super.key});

  @override
  State<DepartementPage> createState() => _DepartementPageState();
}

class _DepartementPageState extends State<DepartementPage> {
  bool isEmptyData = false;

  final searchController = TextEditingController();
  late List<Department> searchResult;

  @override
  void initState() {
    //searchResult = departements;
    context.read<DepartmentBloc>().add(const DepartmentEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Departement'),
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
                          // searchResult = departements
                          //     .where((element) => element.departementName
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
                        builder: (context) => const AddNewDepartement(),
                      ),
                      label: 'Add New Departement',
                      fontSize: 14.0,
                      width: 250.0,
                    ),
                  ],
                ),
              ),
              BlocBuilder<DepartmentBloc, DepartmentState>(
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
                                            label: Text('Departement Name')),
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
                                                    item.departmentName ?? '',
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.black,
                                                    ),
                                                  )),
                                                  DataCell(Text(
                                                      item.description ?? '')),
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
                                                                      DepartmentBloc,
                                                                      DepartmentState>(
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
                                                                              context.read<DepartmentBloc>().add(DepartmentEvent.delete(item.id!));
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
                                                            showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              EditDepartement(
                                                            item: item,
                                                          ),
                                                        ),
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
