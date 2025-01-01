import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
import '../../../data/models/request/attendance_request_model.dart';
import '../../../data/models/response/attendance_response_model.dart';
import '../../../data/models/response/auth_response_model.dart';
import '../blocs/attendance/edit_attendance/edit_attendance_bloc.dart';
import '../blocs/attendance/get_attendance/get_attendance_bloc.dart';
import '../blocs/staff/staff_bloc.dart';

class EditAttendance extends StatefulWidget {
  final Attendance item;
  const EditAttendance({super.key, required this.item});

  @override
  State<EditAttendance> createState() => _EditAttendanceState();
}

class _EditAttendanceState extends State<EditAttendance> {
  final users = ['Olivia Rhye', 'Andi Wijaya', 'Budi Santoso'];
  User? selectedUser;
  late final TextEditingController nameController;
  DateTime? dateTime;
  DateTime? clockInTime;
  DateTime? clockOutTime;
  late bool isLate;
  late bool isHalfDay;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.item.user?.name ?? '');
    dateTime = widget.item.date;
    final DateFormat formatter = DateFormat('HH:mm:ss');
    clockInTime = widget.item.clockInDateTime;
    clockOutTime = widget.item.clockOutDateTime;
    isLate = widget.item.isLate ?? false;
    isHalfDay = widget.item.isHalfDay ?? false;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
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
                  'Edit Attendance',
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
                            value: selectedUser ?? widget.item.user,
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
                  child: CustomDatePicker(
                      initialDate: dateTime,
                      label: 'Date',
                      hintText: 'Select Date',
                      onDateSelected: (selectedDate) {
                        dateTime = selectedDate;
                      }),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                Flexible(
                  child: CustomTimePicker(
                    initialTime: clockInTime != null
                        ? TimeOfDay.fromDateTime(clockInTime!)
                        : null,
                    label: 'Clock In Time',
                    hintText: 'Select time',
                    onTimeSelected: (selectedTime) async {
                      final selectedDateTime = DateTime(
                        dateTime?.year ?? DateTime.now().year,
                        dateTime?.month ?? DateTime.now().month,
                        dateTime?.day ?? DateTime.now().day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                      setState(() {
                        clockInTime = selectedDateTime;
                      });
                    },
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomTimePicker(
                    initialTime: clockOutTime != null
                        ? TimeOfDay.fromDateTime(clockOutTime!)
                        : null,
                    label: 'Clock Out Time',
                    hintText: 'Select time',
                    onTimeSelected: (selectedTime) async {
                      final selectedDateTime = DateTime(
                        dateTime?.year ?? DateTime.now().year,
                        dateTime?.month ?? DateTime.now().month,
                        dateTime?.day ?? DateTime.now().day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                      setState(() {
                        clockOutTime = selectedDateTime;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                YesNoToggle(
                  label: 'Is Late',
                  initialValue: isLate,
                  onChanged: (isYesSelected) {
                    isLate = isYesSelected;
                  },
                ),
                const SpaceWidth(50.0),
                YesNoToggle(
                  label: 'Is Half Day',
                  initialValue: isHalfDay,
                  onChanged: (isYesSelected) {
                    isHalfDay = isYesSelected;
                  },
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
                    child:
                        BlocListener<EditAttendanceBloc, EditAttendanceState>(
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
                          success: (attendance) {
                            context.pop(context);
                            context
                                .read<GetAttendanceBloc>()
                                .add(const GetAttendanceEvent.fetch());
                          },
                        );
                      },
                      child: Button.filled(
                        onPressed: () {
                          final formattedClockInTime = clockInTime != null
                              ? DateFormat("yyyy-MM-dd HH:mm:ss")
                                  .format(clockInTime!)
                              : null;
                          final formattedClockOutTime = clockOutTime != null
                              ? DateFormat("yyyy-MM-dd HH:mm:ss")
                                  .format(clockOutTime!)
                              : null;
                          final attendance = AttendanceRequestModel(
                              userId: selectedUser?.id ?? widget.item.userId,
                              date: dateTime,
                              clockInDateTime: formattedClockInTime,
                              clockOutDateTime: formattedClockOutTime,
                              isLate: isLate,
                              isHalfDay: isHalfDay);
                          context.read<EditAttendanceBloc>().add(
                              EditAttendanceEvent.edit(
                                  attendance, widget.item.id!));
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
    );
  }
}
