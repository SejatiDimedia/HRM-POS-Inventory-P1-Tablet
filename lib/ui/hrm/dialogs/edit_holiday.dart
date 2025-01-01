import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/holidays_response_model.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
import '../../../data/models/request/holiday_request_model.dart';
import '../blocs/holiday/holiday_bloc.dart';

class EditHoliday extends StatefulWidget {
  final Holiday item;
  const EditHoliday({
    super.key,
    required this.item,
  });

  @override
  State<EditHoliday> createState() => _EditHolidayState();
}

class _EditHolidayState extends State<EditHoliday> {
  late final TextEditingController holidayNameController;
  late final TextEditingController datetimeController;
  DateTime? selectedDate;

  @override
  void initState() {
    holidayNameController = TextEditingController(text: widget.item.name);
    datetimeController =
        TextEditingController(text: widget.item.date.toString());
    super.initState();
  }

  @override
  void dispose() {
    holidayNameController.dispose();
    datetimeController.dispose();
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
                  'Edit Holiday',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: holidayNameController,
                  label: 'Name',
                  hintText: 'Please Enter Name',
                  textInputAction: TextInputAction.next,
                ),
                const SpaceHeight(12.0),
                CustomDatePicker(
                  initialDate: widget.item.date,
                  label: 'Date',
                  hintText: 'Select Date',
                  onDateSelected: (date) {
                    selectedDate = date;
                    datetimeController.text = date.toString();
                  },
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
                      child: BlocConsumer<HolidayBloc, HolidayState>(
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
                              final newHoliday = Holiday(
                                id: data.data!.id,
                                name: data.data!.name,
                                date: data.data!.date,
                                companyId: data.data!.companyId,
                                year: data.data!.year,
                                month: data.data!.month,
                                createdBy: data.data!.createdBy,
                              );
                              context
                                  .read<HolidayBloc>()
                                  .add(HolidayEvent.updateHoliday(newHoliday));

                              context.pop();
                            },
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return Button.filled(
                                onPressed: () {
                                  final formattedDate = selectedDate != null
                                      ? DateFormat('yyyy-MM-dd')
                                          .format(selectedDate!)
                                      : DateFormat('yyyy-MM-dd').format(
                                          DateTime.parse(
                                              datetimeController.text));

                                  final dataRequest = HolidayRequestModel(
                                    name: holidayNameController.text,
                                    date: DateTime.parse(formattedDate),
                                    year: selectedDate?.year ??
                                        DateTime.parse(datetimeController.text)
                                            .year,
                                    month: selectedDate?.month ??
                                        DateTime.parse(datetimeController.text)
                                            .month,
                                  );

                                  context.read<HolidayBloc>().add(
                                        HolidayEvent.edit(
                                          dataRequest,
                                          widget.item.id!,
                                        ),
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
      ),
    );
  }
}
