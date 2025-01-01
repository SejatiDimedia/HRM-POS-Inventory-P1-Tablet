import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/leave_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/auth_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/leave_type_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/leave/leave_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/leave_type/leave_type_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/staff/staff_bloc.dart';

import '../../../core/core.dart';
import '../../../data/models/response/leave_reasponse_model.dart';

class AddNewLeave extends StatefulWidget {
  const AddNewLeave({super.key});

  @override
  State<AddNewLeave> createState() => _AddNewLeaveState();
}

class _AddNewLeaveState extends State<AddNewLeave> {
  final statuses = ['Pending', 'Approved', 'Rejected'];

  User? selectedUser;
  LeaveType? selectedLeaveType;

  late final TextEditingController nameController;
  late final TextEditingController leaveTypeController;
  late final TextEditingController reasonController;
  late final TextEditingController statusController;

  DateTime? selectStartDate;
  DateTime? selectEndDate;
  late bool isHalfDay;

  @override
  void initState() {
    nameController = TextEditingController();
    leaveTypeController = TextEditingController();
    reasonController = TextEditingController();
    statusController = TextEditingController(text: statuses.first);

    isHalfDay = false;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    leaveTypeController.dispose();
    reasonController.dispose();
    super.dispose();
  }

  int calculateTotalDays(DateTime? startDate, DateTime? endDate) {
    if (startDate != null && endDate != null) {
      return endDate.difference(startDate).inDays + 1; // add 1 for inklusif
    }
    return 0;
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
                  'Add New Leave',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
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
                Flexible(
                  child: BlocBuilder<StaffBloc, StaffState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => CustomDropdown(
                          value: '-',
                          items: const ['-'],
                          label: 'Name',
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
                            label: 'Name',
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
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: BlocBuilder<LeaveTypeBloc, LeaveTypeState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => CustomDropdown(
                          value: '-',
                          items: const ['-'],
                          label: 'Name',
                          onChanged: (value) {},
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        failed: (message) => Center(
                          child: Text(message),
                        ),
                        success: (data) {
                          return CustomDropdown<LeaveType>(
                            value: selectedLeaveType ?? data.first,
                            items: data,
                            label: 'Leave Type',
                            onChanged: (value) {
                              setState(() {
                                selectedLeaveType = value;
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
                  child: CustomDatePicker(
                    initialDate: selectStartDate,
                    label: 'Start Date',
                    onDateSelected: (selectedDate) {
                      selectStartDate = selectedDate;
                    },
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomDatePicker(
                    initialDate: selectEndDate,
                    label: 'End Date',
                    onDateSelected: (selectedDate) {
                      selectEndDate = selectedDate;
                    },
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: YesNoToggle(
                    label: 'Is Half Day',
                    initialValue: isHalfDay,
                    onChanged: (isYesSelected) {
                      isHalfDay = isYesSelected;
                    },
                  ),
                ),
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
            CustomTextField(
              controller: reasonController,
              label: 'Reason',
              hintText: 'Please Enter Reason',
              maxLines: 5,
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
                      onPressed: () => context.pop(),
                      label: 'Cancel',
                    ),
                  ),
                  const SpaceWidth(16.0),
                  Flexible(
                    child: BlocConsumer<LeaveBloc, LeaveState>(
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
                            final newLeave = Leave(
                              id: data.data!.id,
                              companyId: data.data!.companyId,
                              userId: data.data!.userId,
                              leaveTypeId: data.data!.leaveTypeId,
                              startDate: data.data!.startDate,
                              endDate: data.data!.endDate,
                              totalDays: data.data!.totalDays,
                              isHalfDay: data.data!.isHalfDay,
                              reason: data.data!.reason,
                              isPaid: data.data!.isPaid,
                              status: data.data!.status,
                              user: data.data!.user,
                              leaveType: data.data!.leaveType,
                              createdAt: data.data!.createdAt,
                              updatedAt: data.data!.updatedAt,
                            );

                            context.read<LeaveBloc>().add(
                                  LeaveEvent.addNewLeave(
                                    newLeave,
                                  ),
                                );

                            context.pop(context);
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return Button.filled(
                              onPressed: () {
                                final leave = LeaveRequestModel(
                                  userId: selectedUser!.id,
                                  leaveTypeId: selectedLeaveType!.id,
                                  startDate: selectStartDate,
                                  endDate: selectEndDate,
                                  totalDays: calculateTotalDays(
                                      selectStartDate, selectEndDate),
                                  isHalfDay: isHalfDay,
                                  reason: reasonController.text,
                                  isPaid: true,
                                  status: statusController.text.toLowerCase(),
                                );

                                context
                                    .read<LeaveBloc>()
                                    .add(LeaveEvent.add(leave));
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
