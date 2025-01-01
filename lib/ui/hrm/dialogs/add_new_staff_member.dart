import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/auth_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/department_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/designation_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/role_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/shift_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/department/department_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/designation/designation_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/role/role_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/shift/shift_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/staff/staff_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/core.dart';

class AddNewStaffMember extends StatefulWidget {
  const AddNewStaffMember({super.key});

  @override
  State<AddNewStaffMember> createState() => _AddNewStaffMemberState();
}

class _AddNewStaffMemberState extends State<AddNewStaffMember> {
  final statuses = ['Enable', 'Disable'];
  //final shifts = ['Pagi', 'Siang', 'Malam'];

  Department? selectedDepartmentId;
  Designation? selectedDesignationId;
  Shift? selectedShiftId;
  Role? selectedRoleId;

  XFile? imageFile;

  late final TextEditingController warehouseController;
  //late final TextEditingController roleController;
  late final TextEditingController nameController;
  late final TextEditingController usernameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController statusController;
  //late final TextEditingController departmentController;
  //late final TextEditingController designationController;
  //late final TextEditingController shiftController;
  late final TextEditingController addressController;

  @override
  void initState() {
    warehouseController = TextEditingController();
    //roleController = TextEditingController();
    nameController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberController = TextEditingController();
    statusController = TextEditingController();
    //departmentController = TextEditingController();
    //designationController = TextEditingController();
    //shiftController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    warehouseController.dispose();
    //roleController.dispose();
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    statusController.dispose();
    //departmentController.dispose();
    //designationController.dispose();
    //shiftController.dispose();
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

  bool _validateInputs() {
    if (warehouseController.text.isEmpty) {
      _showErrorSnackBar('Warehouse is required');
      return false;
    }
    if (selectedRoleId == null) {
      _showErrorSnackBar('Role is required');
      return false;
    }
    if (nameController.text.isEmpty) {
      _showErrorSnackBar('Name is required');
      return false;
    }
    if (usernameController.text.isEmpty) {
      _showErrorSnackBar('Username is required');
      return false;
    }
    if (emailController.text.isEmpty || !_isValidEmail(emailController.text)) {
      _showErrorSnackBar('Valid email is required');
      return false;
    }
    if (passwordController.text.isEmpty || passwordController.text.length < 6) {
      _showErrorSnackBar('Password must be at least 6 characters long');
      return false;
    }
    if (phoneNumberController.text.isEmpty) {
      _showErrorSnackBar('Phone Number is required');
      return false;
    }
    if (statusController.text.isEmpty) {
      _showErrorSnackBar('Status is required');
      return false;
    }
    if (selectedDepartmentId == null) {
      _showErrorSnackBar('Department is required');
      return false;
    }
    if (selectedDesignationId == null) {
      _showErrorSnackBar('Designation is required');
      return false;
    }
    if (selectedShiftId == null) {
      _showErrorSnackBar('Shift is required');
      return false;
    }
    if (addressController.text.isEmpty) {
      _showErrorSnackBar('Address is required');
      return false;
    }
    return true;
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegex.hasMatch(email);
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
                  'Add New Staff Member',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpaceHeight(4.0),
                Text('Please Complete Add New Staff Member'),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                      vertical: 4.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Profile Image',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        const Text(
                          'Upload profile picture',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Row(
                          children: [
                            if (imageFile != null)
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
                            const Spacer(),
                            Column(
                              children: [
                                InkWell(
                                  onTap: _removePhoto,
                                  child: const Tooltip(
                                    message: 'Delete photo',
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                InkWell(
                                  onTap: _choosePhoto,
                                  child: const Tooltip(
                                    message: 'Choose a photo',
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Choose Photo',
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                            value: selectedRoleId ?? data.first,
                            items: data,
                            label: 'Role',
                            onChanged: (value) {
                              setState(() {
                                selectedRoleId = value;
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
                    value: statuses.first,
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
                            value: selectedDepartmentId ?? data.first,
                            items: data,
                            label: 'Department',
                            onChanged: (value) {
                              setState(() {
                                selectedDepartmentId = value;
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
                            value: selectedDesignationId ?? data.first,
                            items: data,
                            label: 'Designation',
                            onChanged: (value) {
                              setState(() {
                                selectedDesignationId = value;
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
                            value: selectedShiftId ?? data.first,
                            items: data,
                            label: 'Shift',
                            onChanged: (value) {
                              setState(() {
                                selectedShiftId = value;
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
                        context.pop();
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
                          successAdd: (data) {
                            final newStaff = User(
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

                            debugPrint("image: ${data.data?.profileImage}");
                            debugPrint("role: ${data.data?.roles}");
                            debugPrint("depart: ${data.data?.department}");
                            debugPrint(
                                "designation: ${data.data?.designation}");
                            debugPrint("shift: ${data.data?.shift}");

                            context
                                .read<StaffBloc>()
                                .add(StaffEvent.addNewStaff(
                                  newStaff,
                                ));

                            context.pop(context);
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return Button.filled(
                              onPressed: () {
                                if (_validateInputs()) {
                                  final user = User(
                                    username: usernameController.text,
                                    warehouseId:
                                        int.parse(warehouseController.text),
                                    roleId: selectedRoleId!.id,
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneNumberController.text,
                                    address: addressController.text,
                                    status: statusController.text,
                                    departmentId: selectedDepartmentId!.id,
                                    designationId: selectedDesignationId!.id,
                                    shiftId: selectedShiftId!.id,
                                  );

                                  context.read<StaffBloc>().add(
                                        StaffEvent.add(user, imageFile,
                                            passwordController.text),
                                      );
                                } else {
                                  // Show an error message to the user
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please fill all fields'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
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
    );
  }
}
