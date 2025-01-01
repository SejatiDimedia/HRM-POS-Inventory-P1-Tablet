import 'package:flutter/material.dart';

import '../../../core/core.dart';

class AddNewWarehouse extends StatefulWidget {
  final VoidCallback onConfirmTap;
  const AddNewWarehouse({super.key, required this.onConfirmTap});

  @override
  State<AddNewWarehouse> createState() => _AddNewWarehouseState();
}

class _AddNewWarehouseState extends State<AddNewWarehouse> {
  late final TextEditingController warehouseController;

  @override
  void initState() {
    warehouseController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    warehouseController.dispose();
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
                  'Add New Warehouse',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: warehouseController,
                  label: 'Warehouse',
                  hintText: 'Please Enter Warehouse',
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
