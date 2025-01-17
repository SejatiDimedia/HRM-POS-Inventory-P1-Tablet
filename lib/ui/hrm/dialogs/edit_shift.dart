import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/shift_response_model.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
import '../../../data/models/request/shift_request_model.dart';
import '../blocs/shift/shift_bloc.dart';

class EditShift extends StatefulWidget {
  final Shift item;
  const EditShift({super.key, required this.item});

  @override
  State<EditShift> createState() => _EditShiftState();
}

class _EditShiftState extends State<EditShift> {
  late final TextEditingController shiftNameController;
  late final TextEditingController lateMarkAfterController;
  late DateTime clockInTime;
  late DateTime clockOutTime;
  late bool isSelfClocking;

  @override
  void initState() {
    shiftNameController = TextEditingController(text: widget.item.shiftName);
    lateMarkAfterController =
        TextEditingController(text: '${widget.item.lateMarkAfter}');
    final DateFormat formatter = DateFormat('HH:mm:ss');
    clockInTime = formatter.parse(widget.item.clockInTime!);
    clockOutTime = formatter.parse(widget.item.clockOutTime!);
    isSelfClocking = widget.item.selfClocking ?? false;
    super.initState();
  }

  @override
  void dispose() {
    shiftNameController.dispose();
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
                  'Edit Shift',
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
                    controller: shiftNameController,
                    label: 'Name',
                    hintText: 'Please Enter Name',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomTimePicker(
                    initialTime: TimeOfDay.fromDateTime(clockInTime),
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
                    initialTime: TimeOfDay.fromDateTime(clockOutTime),
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
                        context.pop(context);
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
                          successEdit: (data) {
                            final updateShift = Shift(
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
                                .add(ShiftEvent.updateShift(updateShift));
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
                                  shiftName: shiftNameController.text,
                                  clockInTime: DateFormat("HH:mm:ss")
                                      .format(clockInTime),
                                  clockOutTime: DateFormat("HH:mm:ss")
                                      .format(clockOutTime),
                                  lateMarkAfter:
                                      int.parse(lateMarkAfterController.text),
                                  selfClocking: isSelfClocking,
                                );

                                context.read<ShiftBloc>().add(ShiftEvent.edit(
                                    dataRequest, widget.item.id!));
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
