import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/auth_response_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/core.dart';
import '../../../data/models/response/department_response_model.dart';
import '../../../data/models/response/designation_response_model.dart';
import '../../../data/models/response/role_response_model.dart';
import '../../../data/models/response/shift_response_model.dart';
import '../blocs/department/department_bloc.dart';
import '../blocs/designation/designation_bloc.dart';
import '../blocs/role/role_bloc.dart';
import '../blocs/shift/shift_bloc.dart';
import '../blocs/staff/staff_bloc.dart';

class EditStaffMember extends StatefulWidget {
  final User item;
  const EditStaffMember({super.key, required this.item});

  @override
  State<EditStaffMember> createState() => _EditStaffMemberState();
}

class _EditStaffMemberState extends State<EditStaffMember> {
  final statuses = ['Enable', 'Disable'];
  Department? selectedDepartment;
  Designation? selectedDesignation;
  Shift? selectedShift;
  Role? selectedRole;

  XFile? imageFile;

  late final TextEditingController warehouseController;
  late final TextEditingController nameController;
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController statusController;
  late final TextEditingController addressController;

  @override
  void initState() {
    warehouseController =
        TextEditingController(text: widget.item.warehouseId?.toString() ?? '');
    nameController = TextEditingController(text: widget.item.name);
    usernameController = TextEditingController(text: widget.item.username);
    emailController = TextEditingController(text: widget.item.email);
    passwordController =
        TextEditingController(); // Password field should be empty initially
    phoneNumberController = TextEditingController(text: widget.item.phone);
    statusController =
        TextEditingController(text: widget.item.status ?? 'Enable');
    addressController = TextEditingController(text: widget.item.address);
    super.initState();
  }

  @override
  void dispose() {
    warehouseController.dispose();
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    statusController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future<void> _choosePhoto() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        imageFile = pickedFile;
      } else {
        debugPrint('No image selected.');
        _showErrorSnackBar('No image selected.');
      }
    });
  }

  void _removePhoto() {
    setState(() {
      imageFile = null;
    });
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth - 600.0,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Staff Member',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpaceHeight(4.0),
                Text('Please Complete Edit Staff Member'),
                SpaceHeight(16.0),
                Divider(),
              ],
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Profile Image',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SpaceHeight(4.0),
                    const Text(
                      'Upload profile picture',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        if (widget.item.profileImage != null)
                          ClipOval(
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${Variables.baseUrlImage}/${widget.item.profileImage}",
                              height: 64.0,
                              width: 64.0,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image,
                                color: AppColors.primary,
                                size: 30,
                              ),
                            ),
                          )
                        else if (imageFile != null)
                          ClipOval(
                            child: Image.file(
                              File(imageFile!.path),
                              height: 64.0,
                              width: 64.0,
                              fit: BoxFit.cover,
                            ),
                          )
                        else
                          const ClipOval(
                            child: Icon(
                              Icons.person,
                              size: 64.0,
                              color: Colors.grey,
                            ),
                          ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    InkWell(
                      onTap: _removePhoto,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            color: AppColors.red,
                          ),
                        ),
                      ),
                    ),
                    const SpaceWidth(8.0),
                    InkWell(
                      onTap: _choosePhoto,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Choose Update Photo',
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SpaceHeight(16.0),
            const Divider(),
            Row(
              children: [
                Flexible(
                  child: CustomTextField(
                    controller: warehouseController,
                    label: 'Warehouse',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: BlocBuilder<RoleBloc, RoleState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => CustomDropdown(
                          value: '-',
                          items: const ['-'],
                          label: 'Role',
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
                          return CustomDropdown<Role>(
                            value: selectedRole ??
                                widget.item.roles?.first ??
                                Role(displayName: '-'),
                            items: data,
                            label: 'Role',
                            onChanged: (value) {
                              setState(() {
                                selectedRole = value;
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
            const SpaceHeight(16.0),
            CustomTextField(
              controller: nameController,
              label: 'Name',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            const SpaceHeight(16.0),
            CustomTextField(
              controller: usernameController,
              label: 'User Name',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            const SpaceHeight(16.0),
            CustomTextField(
              controller: emailController,
              label: 'Email Address',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
            const SpaceHeight(16.0),
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            const Text(
              "**Password wajib di update",
              style: TextStyle(
                fontSize: 10,
                color: AppColors.red,
              ),
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                Flexible(
                  child: CustomTextField(
                    controller: phoneNumberController,
                    label: 'Phone Number',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomDropdown(
                    value: statusController.text,
                    items: statuses,
                    label: 'Status',
                    onChanged: (value) {
                      statusController.text = value ?? '';
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                Flexible(
                  child: BlocBuilder<DepartmentBloc, DepartmentState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => CustomDropdown(
                          value: '-',
                          items: const ['-'],
                          label: 'Department',
                          onChanged: (value) {},
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        failed: (message) => Center(
                          child: Text(message),
                        ),
                        success: (data) {
                          //selectedDepartmentId = data.first;
                          return CustomDropdown<Department>(
                            value: selectedDepartment ?? widget.item.department,
                            items: data,
                            label: 'Department',
                            onChanged: (value) {
                              setState(() {
                                selectedDepartment = value;
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: BlocBuilder<DesignationBloc, DesignationState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => CustomDropdown(
                          value: '-',
                          items: const ['-'],
                          label: 'Designation',
                          onChanged: (value) {},
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        failed: (message) => Center(
                          child: Text(message),
                        ),
                        success: (data) {
                          //selectedDesignationId = data.first;
                          return CustomDropdown<Designation>(
                            value:
                                selectedDesignation ?? widget.item.designation,
                            items: data,
                            label: 'Designation',
                            onChanged: (value) {
                              setState(() {
                                selectedDesignation = value;
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
            const SpaceHeight(16.0),
            Row(
              children: [
                Flexible(
                  child: BlocBuilder<ShiftBloc, ShiftState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => CustomDropdown(
                          value: '-',
                          items: const ['-'],
                          label: 'Shift',
                          onChanged: (value) {},
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        failed: (message) => Center(
                          child: Text(message),
                        ),
                        success: (data) {
                          //selectedShiftId = data.first;
                          return CustomDropdown<Shift>(
                            value: selectedShift ?? widget.item.shift,
                            items: data,
                            label: 'Shift',
                            onChanged: (value) {
                              setState(() {
                                selectedShift = value;
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomTextField(
                    controller: addressController,
                    label: 'Address',
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Padding(
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
                        context.pop(context);
                      },
                      label: 'Cancel',
                    ),
                  ),
                  const SpaceWidth(16.0),
                  Flexible(
                    child: BlocConsumer<StaffBloc, StaffState>(
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
                            final updateStaff = User(
                              username: data.data!.username ?? '',
                              warehouseId: data.data!.warehouseId!,
                              roleId: data.data!.roleId!,
                              name: data.data!.name!,
                              email: data.data!.email!,
                              phone: data.data?.phone ?? '',
                              address: data.data?.address ?? '',
                              status: data.data!.status!,
                              departmentId: data.data!.departmentId!,
                              designationId: data.data!.designationId!,
                              shiftId: data.data!.shiftId!,
                              profileImage: data.data?.profileImage,
                              roles: data.data!.roles,
                              shift: data.data!.shift,
                              department: data.data!.department,
                              designation: data.data!.designation,
                            );

                            context
                                .read<StaffBloc>()
                                .add(StaffEvent.updateStaff(
                                  updateStaff,
                                ));

                            context
                                .read<StaffBloc>()
                                .add(const StaffEvent.fetch());

                            context.pop(context);
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return Button.filled(
                              onPressed: () {
                                final user = User(
                                  username: usernameController.text,
                                  warehouseId:
                                      int.parse(warehouseController.text),
                                  roleId:
                                      selectedRole?.id ?? widget.item.roleId,
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneNumberController.text,
                                  address: addressController.text,
                                  status: statusController.text,
                                  departmentId: selectedDepartment?.id ??
                                      widget.item.departmentId,
                                  designationId: selectedDesignation?.id ??
                                      widget.item.designationId,
                                  shiftId:
                                      selectedShift?.id ?? widget.item.shiftId,
                                );

                                context.read<StaffBloc>().add(
                                      StaffEvent.edit(
                                          user,
                                          imageFile,
                                          passwordController.text,
                                          widget.item.id!),
                                    );
                              },
                              label: 'Update',
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
    );
  }
}
