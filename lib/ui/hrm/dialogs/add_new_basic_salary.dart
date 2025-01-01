import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/basic_salary_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/basic_salary/get_basic_salary/get_basic_salary_bloc.dart';

import '../../../core/core.dart';
import '../../../data/models/response/auth_response_model.dart';
import '../blocs/basic_salary/add_basic_salary/add_basic_salary_bloc.dart';
import '../blocs/staff/staff_bloc.dart';

class AddNewBasicSalary extends StatefulWidget {
  const AddNewBasicSalary({super.key});

  @override
  State<AddNewBasicSalary> createState() => _AddNewBasicSalaryState();
}

class _AddNewBasicSalaryState extends State<AddNewBasicSalary> {
  // final users = ['Fauzan', 'Abdillah'];
  // late final TextEditingController userSelectedController;
  late final TextEditingController basicSalaryController;
  User? selectedUser;

  @override
  void initState() {
    //userSelectedController = TextEditingController(text: users.first);
    basicSalaryController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // userSelectedController.dispose();
    basicSalaryController.dispose();
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
                  'Add New Basic Salary',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                BlocBuilder<StaffBloc, StaffState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => CustomDropdown(
                        value: '-',
                        items: const ['-'],
                        label: 'User',
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
                        return CustomDropdown<User>(
                          value: selectedUser ?? data.first,
                          items: data,
                          label: 'User',
                          onChanged: (value) {
                            setState(() {
                              selectedUser = value;
                            });
                          },
                        );
                      },
                    );
                  },
                ),
                const SpaceHeight(12.0),
                CustomTextField(
                  controller: basicSalaryController,
                  label: 'Basic Salary',
                  hintText: 'Please Enter Basic Salary',
                  keyboardType: TextInputType.number,
                  prefixIcon: const SizedBox(
                    width: 50.0,
                    child: Center(
                      child: Text('Rp'),
                    ),
                  ),
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
                      child:
                          BlocListener<AddBasicSalaryBloc, AddBasicSalaryState>(
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
                            success: (basicSalary) {
                              context.pop(context);
                              context
                                  .read<GetBasicSalaryBloc>()
                                  .add(const GetBasicSalaryEvent.fetch());
                            },
                          );
                        },
                        child: Button.filled(
                          onPressed: () {
                            final data = BasicSalaryRequestModel(
                              basicSalary:
                                  int.parse(basicSalaryController.text),
                              userId: selectedUser!.id,
                            );
                            context
                                .read<AddBasicSalaryBloc>()
                                .add(AddBasicSalaryEvent.add(data));
                          },
                          label: 'Create',
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
}
