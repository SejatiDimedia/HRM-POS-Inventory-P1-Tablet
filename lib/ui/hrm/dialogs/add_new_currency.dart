import 'package:flutter/material.dart';

import '../../../core/core.dart';

class AddNewCurrency extends StatefulWidget {
  final VoidCallback onConfirmTap;
  const AddNewCurrency({super.key, required this.onConfirmTap});

  @override
  State<AddNewCurrency> createState() => _AddNewCurrencyState();
}

class _AddNewCurrencyState extends State<AddNewCurrency> {
  late final TextEditingController currencyNameController;
  late final TextEditingController currencySymbolController;

  @override
  void initState() {
    currencyNameController = TextEditingController();
    currencySymbolController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    currencyNameController.dispose();
    currencySymbolController.dispose();
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
                  'Add New Currency',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: currencyNameController,
                  label: 'Currency Name',
                  hintText: 'Rupiah',
                  textInputAction: TextInputAction.next,
                ),
                const SpaceHeight(12.0),
                CustomTextField(
                  controller: currencySymbolController,
                  label: 'Currency Symbol',
                  hintText: 'Rp',
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
                      child: Button.filled(
                        onPressed: widget.onConfirmTap,
                        label: 'Create',
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
