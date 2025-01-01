import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/role_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/role_response_model.dart';

import '../../../core/core.dart';
import '../blocs/role/role_bloc.dart';

class AddNewRole extends StatefulWidget {
  const AddNewRole({
    super.key,
  });

  @override
  State<AddNewRole> createState() => _AddNewRoleState();
}

class _AddNewRoleState extends State<AddNewRole> {
  late final TextEditingController roleNameController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    roleNameController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    roleNameController.dispose();
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
                  'Add New Role',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: roleNameController,
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
                      child: BlocConsumer<RoleBloc, RoleState>(
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

                              final newRole = Role(
                                id: data.role!.id,
                                companyId: data.role!.companyId!,
                                roleName: data.role!.roleName!,
                                displayName: data.role?.displayName ?? '',
                                description: data.role?.description ?? '',
                                createdAt: data.role!.createdAt!,
                              );
                              context
                                  .read<RoleBloc>()
                                  .add(RoleEvent.addNewRole(newRole));
                            },
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return Button.filled(
                                onPressed: () {
                                  final dataRequest = RoleRequestModel(
                                    roleName: roleNameController.text,
                                    description: descriptionController.text,
                                  );

                                  context
                                      .read<RoleBloc>()
                                      .add(RoleEvent.add(dataRequest));
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
