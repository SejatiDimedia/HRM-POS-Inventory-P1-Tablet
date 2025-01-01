import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/department_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/department_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/department/department_bloc.dart';

import '../../../core/core.dart';

class AddNewDepartement extends StatefulWidget {
  const AddNewDepartement({
    super.key,
  });

  @override
  State<AddNewDepartement> createState() => _AddNewDepartementState();
}

class _AddNewDepartementState extends State<AddNewDepartement> {
  late final TextEditingController departementNameController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    departementNameController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    departementNameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 500.0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add New Department',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: departementNameController,
                  label: 'Name',
                  hintText: 'Please Enter Name',
                  textInputAction: TextInputAction.next,
                ),
                const SpaceHeight(12.0),
                CustomTextField(
                  controller: descriptionController,
                  label: 'Description',
                  hintText: 'Please Enter Description',
                  maxLines: 5,
                ),
                const SpaceHeight(24.0),
                Row(
                  children: [
                    Flexible(
                        child: Button.outlined(
                      onPressed: () => context.pop(),
                      label: 'Cancel',
                    )),
                    const SpaceWidth(16.0),
                    Flexible(
                      child: BlocConsumer<DepartmentBloc, DepartmentState>(
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
                            successAdd: (data) {
                              context.pop();

                              final newDepart = Department(
                                id: data.department!.id,
                                companyId: data.department!.companyId!,
                                departmentName:
                                    data.department!.departmentName!,
                                description: data.department?.description ?? '',
                                createdBy: data.department!.createdBy!,
                                createdAt: data.department!.createdAt!,
                              );
                              context
                                  .read<DepartmentBloc>()
                                  .add(DepartmentEvent.addNewDepart(newDepart));
                            },
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return Button.filled(
                                onPressed: () {
                                  final dataRequest = DepartmentRequestModel(
                                    departmentName:
                                        departementNameController.text,
                                    description: descriptionController.text,
                                  );

                                  context
                                      .read<DepartmentBloc>()
                                      .add(DepartmentEvent.add(dataRequest));
                                },
                                label: 'Create',
                              );
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
