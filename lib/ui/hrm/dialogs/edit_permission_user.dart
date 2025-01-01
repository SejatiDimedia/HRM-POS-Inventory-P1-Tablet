import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/role_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/permissions/get_all_permission/get_all_permission_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/role/role_bloc.dart';
import '../../../core/core.dart';
import '../../../data/models/request/role_permission_request_model.dart';
import '../../../data/models/response/permission_response_model.dart';

class EditPermissionUser extends StatefulWidget {
  final Role item;
  const EditPermissionUser({
    super.key,
    required this.item,
  });

  @override
  State<EditPermissionUser> createState() => _EditPermissionUserState();
}

class _EditPermissionUserState extends State<EditPermissionUser> {
  late Map<String, Map<String, bool>> permissions;
  late List<Permission> allPermissions;

  @override
  void initState() {
    super.initState();
    allPermissions = [];
    context
        .read<GetAllPermissionBloc>()
        .add(const GetAllPermissionEvent.fetch());
    // Initialize permissions state based on widget.item.permissions
    permissions = {
      'shifts': {},
      'departments': {},
      'designations': {},
      'leaves': {},
      'payroll': {},
      'holidays': {},
      'attendance': {},
    };

    // Populate permissions with initial values
    for (var module in permissions.keys) {
      permissions[module]!['view'] = widget.item.permissions
              ?.any((permission) => permission.name == '${module}_view') ??
          false;
      permissions[module]!['add'] = widget.item.permissions
              ?.any((permission) => permission.name == '${module}_add') ??
          false;
      permissions[module]!['edit'] = widget.item.permissions
              ?.any((permission) => permission.name == '${module}_edit') ??
          false;
      permissions[module]!['delete'] = widget.item.permissions
              ?.any((permission) => permission.name == '${module}_delete') ??
          false;
    }
  }

  void updatePermission(String module, String action, bool value) {
    setState(() {
      permissions[module]![action] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth - 600.0,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'HRM Permission',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SpaceHeight(8.0),
              const Divider(),
              const SpaceHeight(8.0),
              ...permissions.keys.map((module) {
                return Column(
                  children: [
                    BlocBuilder<GetAllPermissionBloc, GetAllPermissionState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => const SizedBox(),
                          success: (dataList) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                allPermissions = dataList;
                              });
                            });
                            return const SizedBox();
                          },
                        );
                      },
                    ),
                    buildPermissionRow(module),
                    const SpaceHeight(8.0),
                    const Divider(),
                    const SpaceHeight(8.0),
                  ],
                );
              }),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(),
                const SpaceHeight(16.0),
                Row(
                  children: [
                    Flexible(
                      child: Button.outlined(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        label: 'Cancel',
                      ),
                    ),
                    const SpaceWidth(16.0),
                    Flexible(
                      flex: 1,
                      child: BlocListener<RoleBloc, RoleState>(
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
                            successEdit: (data) {
                              context
                                  .read<RoleBloc>()
                                  .add(const RoleEvent.fetch());
                              context.pop();
                            },
                          );
                        },
                        child: Button.filled(
                          onPressed: () {
                            savePermissions();
                          },
                          label: 'Update',
                        ),
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

  Widget buildPermissionRow(String moduleName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            moduleName,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 16.0,
          runSpacing: 8.0,
          children: [
            buildCheckbox(moduleName, 'view', 'View'),
            buildCheckbox(moduleName, 'add', 'Add'),
            buildCheckbox(moduleName, 'edit', 'Edit'),
            buildCheckbox(moduleName, 'delete', 'Delete'),
          ],
        ),
      ],
    );
  }

  Widget buildCheckbox(String module, String action, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Prevent Row from taking full width
      children: [
        Checkbox(
          value: permissions[module]![action],
          onChanged: (value) {
            updatePermission(module, action, value ?? false);
          },
        ),
        Text(label),
      ],
    );
  }

  void savePermissions() {
    List<int> selectedPermissions = [];

    for (var module in permissions.keys) {
      for (var action in permissions[module]!.keys) {
        if (permissions[module]![action]!) {
          String permissionKey = '${module}_$action';
          // search id permission from allPermissions
          var permission = allPermissions.firstWhere(
            (perm) => perm.name == permissionKey,
            orElse: () => Permission(id: -1), // Handle if nothing
          );

          if (permission.id != -1) {
            selectedPermissions.add(permission.id!);
          }
        }
      }
    }

    final dataPermissions =
        RolePermissionRequestModel(permissions: selectedPermissions);

    context
        .read<RoleBloc>()
        .add(RoleEvent.edit(dataPermissions, widget.item.id!));
    debugPrint("Saving Permissions: $selectedPermissions");
  }
}
