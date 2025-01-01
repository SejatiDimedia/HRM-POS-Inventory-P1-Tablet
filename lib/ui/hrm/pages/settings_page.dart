import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/company_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/company/edit_company/edit_company_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/company/get_company/get_company_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
import '../../../data/models/response/company_response_model.dart';
import '../dialogs/add_new_currency.dart';
import '../dialogs/add_new_warehouse.dart';
import '../dialogs/update_company_profile_success_dialog.dart';
import '../widgets/app_bar_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final currencies = ['Rp', '\$'];
  final warehouses = ['cwb', 'ojan'];
  final statuses = ['Active', 'Disable'];

  late bool isSelfClocking;
  DateTime? dateTime;
  DateTime? clockInTime;
  DateTime? clockOutTime;

  final companyNameController = TextEditingController();
  final companyEmailController = TextEditingController();
  final companyAddressController = TextEditingController();
  final companyPhoneController = TextEditingController();
  final companyWebsiteController = TextEditingController();
  final totalUserController = TextEditingController();
  final earlyClockInTimeController = TextEditingController();
  final allowClockOutTillController = TextEditingController();
  final currencyController = TextEditingController();
  final warehouseController = TextEditingController();
  final dateFormatController = TextEditingController();
  final timeFormatController = TextEditingController();
  late final TextEditingController statusController;

  @override
  void initState() {
    currencyController.text = currencies.first;
    warehouseController.text = warehouses.first;
    statusController = TextEditingController(text: statuses.first);
    isSelfClocking = false;
    context.read<GetCompanyBloc>().add(const GetCompanyEvent.fetch());
    super.initState();
  }

  void _initializeCompanyData(Company dataCompany) {
    companyNameController.text = dataCompany.name ?? '';
    companyEmailController.text = dataCompany.email ?? '';
    companyPhoneController.text = dataCompany.phone ?? '';
    companyWebsiteController.text = dataCompany.website ?? '';
    companyAddressController.text = dataCompany.address ?? '';
    totalUserController.text = dataCompany.totalUsers.toString();
    //currencyController.text = dataCompany.currency ?? currencies.first;
    //warehouseController.text = dataCompany.warehouse ?? warehouses.first;
    statusController.text = dataCompany.status ?? statuses.first;
    earlyClockInTimeController.text =
        dataCompany.earlyClockInTime?.toString() ?? '';
    allowClockOutTillController.text =
        dataCompany.allowClockOutTill?.toString() ?? '';
    // dateFormatController.text = data.dateFormat ?? '';
    // timeFormatController.text = data.timeFormat ?? '';

    isSelfClocking = dataCompany.selfClocking ?? false;
    clockInTime =
        clockInTime ?? _convertStringToDateTime(dataCompany.clockInTime!);
    clockOutTime =
        clockOutTime ?? _convertStringToDateTime(dataCompany.clockOutTime!);
  }

  @override
  void dispose() {
    companyNameController.dispose();
    companyEmailController.dispose();
    companyAddressController.dispose();
    currencyController.dispose();
    warehouseController.dispose();
    dateFormatController.dispose();
    timeFormatController.dispose();
    super.dispose();
  }

  DateTime? _convertStringToDateTime(String timeString) {
    try {
      // Parsing time from format 'HH:mm:ss'
      final parsedTime = DateFormat('HH:mm:ss').parse(timeString);

      final now = DateTime.now();
      return DateTime(
        now.year,
        now.month,
        now.day,
        parsedTime.hour,
        parsedTime.minute,
        parsedTime.second,
      );
    } catch (e) {
      print('Invalid date format: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Company Settings'),
      ),
      body: BlocBuilder<GetCompanyBloc, GetCompanyState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            failed: (message) => Center(
              child: Text(message),
            ),
            success: (data) {
              final dataCompany = data.company;
              if (dataCompany != null) {
                _initializeCompanyData(dataCompany);
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: AppColors.white,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextField(
                          controller: companyNameController,
                          label: 'Company Name',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                        const SpaceHeight(12.0),
                        CustomTextField(
                          controller: companyEmailController,
                          label: 'Company Email',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        const SpaceHeight(12.0),
                        CustomTextField(
                          controller: companyPhoneController,
                          label: 'Company Phone',
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                        ),
                        const SpaceHeight(12.0),
                        CustomTextField(
                          controller: companyWebsiteController,
                          label: 'Company Website',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                        const SpaceHeight(12.0),
                        CustomTextField(
                          controller: companyAddressController,
                          label: 'Company Address',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          maxLines: 5,
                        ),
                        const SpaceHeight(12.0),
                        CustomTextField(
                          controller: totalUserController,
                          label: 'Total User',
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                        const SpaceHeight(12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                            const SpaceWidth(12.0),
                            Flexible(
                              child: YesNoToggle(
                                label: 'Is Self Clocking',
                                initialValue: isSelfClocking,
                                onChanged: (isYesSelected) {
                                  isSelfClocking = isYesSelected;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SpaceHeight(12.0),
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
                                  }),
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
                                  }),
                            ),
                          ],
                        ),
                        const SpaceHeight(16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: CustomTextField(
                                controller: earlyClockInTimeController,
                                label: 'Early Clock In Time',
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Text('Minutes',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                      )),
                                ),
                              ),
                            ),
                            const SpaceWidth(12),
                            Flexible(
                              child: CustomTextField(
                                controller: allowClockOutTillController,
                                label: 'Allow Clock Out Till',
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Text(
                                    'Minutes',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SpaceHeight(16.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              child: CustomDropdown(
                                value: currencyController.text,
                                items: currencies,
                                label: 'Currency',
                                onChanged: (value) {
                                  currencyController.text = value ?? '';
                                  setState(() {});
                                },
                              ),
                            ),
                            const SpaceWidth(12.0),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => AddNewCurrency(
                                  onConfirmTap: () {},
                                ),
                              ),
                              icon: Assets.icons.addRounded.svg(),
                            ),
                          ],
                        ),
                        const SpaceHeight(12.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              child: CustomDropdown(
                                value: warehouseController.text,
                                items: warehouses,
                                label: 'Warehouse',
                                onChanged: (value) {
                                  warehouseController.text = value ?? '';
                                  setState(() {});
                                },
                              ),
                            ),
                            const SpaceWidth(12.0),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => AddNewWarehouse(
                                  onConfirmTap: () {},
                                ),
                              ),
                              icon: Assets.icons.addRounded.svg(),
                            ),
                          ],
                        ),
                        const SpaceHeight(12.0),
                        CustomTextField(
                          controller: dateFormatController,
                          label: 'Date Format',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                        ),
                        const SpaceHeight(12.0),
                        CustomTextField(
                          controller: timeFormatController,
                          label: 'Time Format',
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        const SpaceHeight(12.0),
                        const Divider(),
                        const SpaceHeight(12.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child:
                              BlocListener<EditCompanyBloc, EditCompanyState>(
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
                                success: (data) {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const UpdateCompanyProfileSuccessDialog(),
                                  );
                                  context
                                      .read<GetCompanyBloc>()
                                      .add(const GetCompanyEvent.fetch());
                                },
                              );
                            },
                            child: Button.filled(
                              onPressed: () {
                                final formattedClockInTime = clockInTime != null
                                    ? DateFormat("HH:mm:ss")
                                        .format(clockInTime!)
                                    : null;
                                final formattedClockOutTime =
                                    clockOutTime != null
                                        ? DateFormat("HH:mm:ss")
                                            .format(clockOutTime!)
                                        : null;

                                print(
                                    'Formatted Clock In Time: $formattedClockInTime');
                                print(
                                    'Formatted Clock Out Time: $formattedClockOutTime');

                                final data = CompanyRequestModel(
                                  name: companyNameController.text,
                                  email: companyEmailController.text,
                                  phone: companyPhoneController.text,
                                  website: companyWebsiteController.text,
                                  address: companyAddressController.text,
                                  status: statusController.text,
                                  totalUsers:
                                      int.tryParse(totalUserController.text) ??
                                          0,
                                  clockInTime: formattedClockInTime,
                                  clockOutTime: formattedClockOutTime,
                                  earlyClockInTime: int.tryParse(
                                          earlyClockInTimeController.text) ??
                                      0,
                                  allowClockOutTill: int.tryParse(
                                          allowClockOutTillController.text) ??
                                      0,
                                  selfClocking: isSelfClocking,
                                );

                                print(clockInTime);

                                context
                                    .read<EditCompanyBloc>()
                                    .add(EditCompanyEvent.edit(data));
                              },
                              label: 'Update',
                              width: 150.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
