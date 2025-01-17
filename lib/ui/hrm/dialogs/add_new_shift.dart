import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/shift_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/shift_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/shift/shift_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';

class AddNewShift extends StatefulWidget {
  const AddNewShift({super.key});

  @override
  State<AddNewShift> createState() => _AddNewShiftState();
}

class _AddNewShiftState extends State<AddNewShift> {
  late final TextEditingController shiftController;
  late final TextEditingController lateMarkAfterController;
  DateTime? clockInTime;
  DateTime? clockOutTime;
  late bool isSelfClocking;

  @override
  void initState() {
    shiftController = TextEditingController();
    lateMarkAfterController = TextEditingController();
    isSelfClocking = false;
    super.initState();
  }

  @override
  void dispose() {
    shiftController.dispose();
    lateMarkAfterController.dispose();
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
                  'Add New Shift',
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
                  child: CustomTextField(
                    controller: shiftController,
                    label: 'Name',
                    hintText: 'Please Enter Name',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomTimePicker(
                    initialTime: clockInTime != null
                        ? TimeOfDay.fromDateTime(clockInTime!)
                        : null,
                    label: 'Clock In Time',
                    hintText: 'Select time',
                    onTimeSelected: (selectedTime) async {
                      final now = DateTime.now();
                      final selectedDateTime = DateTime(
                        now.year,
                        now.month,
                        now.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                      setState(() {
                        clockInTime = selectedDateTime;
                      });
                      // final selectedTime = await context.selectTime(
                      //   isClockIn: true,
                      //   clockInTime: clockInTime,
                      //   format: "HH:mm:ss",
                      // );
                      // if (selectedTime != null) {
                      //   setState(() {
                      //     clockInTime = selectedTime;
                      //   });
                      // }
                    },
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                Flexible(
                  child: CustomTimePicker(
                    initialTime: clockOutTime != null
                        ? TimeOfDay.fromDateTime(clockOutTime!)
                        : null,
                    label: 'Clock Out Time',
                    hintText: 'Select time',
                    onTimeSelected: (selectedTime) async {
                      final now = DateTime.now();
                      final selectedDateTime = DateTime(
                        now.year,
                        now.month,
                        now.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                      setState(() {
                        clockOutTime = selectedDateTime;
                      });
                      // final selectedTime = await context.selectTime(
                      //   isClockIn: false,
                      //   clockOutTime: clockOutTime,
                      //   format: "HH:mm:ss",
                      // );
                      // if (selectedTime != null) {
                      //   setState(() {
                      //     clockOutTime = selectedTime;
                      //   });
                      // }
                    },
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomTextField(
                    controller: lateMarkAfterController,
                    label: 'Late Mark After',
                    hintText: 'Please Enter Late Mark After',
                    keyboardType: TextInputType.number,
                    suffixIcon: const SizedBox(
                      width: 80.0,
                      child: Center(
                        child: Text('Minute'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            YesNoToggle(
              label: 'Self Clocking',
              initialValue: isSelfClocking,
              onChanged: (isYesSelected) {
                isSelfClocking = isYesSelected;
              },
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
                    child: BlocConsumer<ShiftBloc, ShiftState>(
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
                            final newShift = Shift(
                              id: data.shift!.id,
                              companyId: data.shift!.companyId!,
                              shiftName: data.shift!.shiftName!,
                              clockInTime: data.shift!.clockInTime!,
                              clockOutTime: data.shift!.clockOutTime!,
                              lateMarkAfter: data.shift?.lateMarkAfter ?? 0,
                              selfClocking: data.shift!.selfClocking!,
                              createdAt: data.shift!.createdAt!,
                            );
                            context
                                .read<ShiftBloc>()
                                .add(ShiftEvent.addNewShift(newShift));
                            context.pop();
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return Button.filled(
                              onPressed: () {
                                final dataRequest = ShiftRequestModel(
                                  shiftName: shiftController.text,
                                  clockInTime: clockInTime != null
                                      ? DateFormat("HH:mm:ss")
                                          .format(clockInTime!)
                                      : null,
                                  clockOutTime: clockOutTime != null
                                      ? DateFormat("HH:mm:ss")
                                          .format(clockOutTime!)
                                      : null,
                                  lateMarkAfter:
                                      int.parse(lateMarkAfterController.text),
                                  selfClocking: isSelfClocking,
                                );

                                context
                                    .read<ShiftBloc>()
                                    .add(ShiftEvent.add(dataRequest));
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
