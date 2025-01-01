import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/designation_request_model.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/designation_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/ui/hrm/blocs/designation/designation_bloc.dart';

import '../../../core/core.dart';

class EditDesignation extends StatefulWidget {
  final Designation item;
  const EditDesignation({
    super.key,
    required this.item,
  });

  @override
  State<EditDesignation> createState() => _EditDesignationState();
}

class _EditDesignationState extends State<EditDesignation> {
  late final TextEditingController designationNameController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    designationNameController =
        TextEditingController(text: widget.item.designationName);
    descriptionController =
        TextEditingController(text: widget.item.description);
    super.initState();
  }

  @override
  void dispose() {
    designationNameController.dispose();
    descriptionController.dispose();
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
                  'Edit Designation',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: designationNameController,
                  label: 'Name',
                  hintText: 'Please Enter Name',
                  textInputAction: TextInputAction.next,
                ),
                const SpaceHeight(12.0),
                CustomTextField(
                  controller: descriptionController,
                  label: 'Description',
                  hintText: 'Please Enter Description',
                  maxLines: 5,
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
                      child: BlocConsumer<DesignationBloc, DesignationState>(
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
                              final updateDesigantion = Designation(
                                id: data.designation!.id,
                                companyId: data.designation!.companyId!,
                                designationName:
                                    data.designation!.designationName!,
                                description:
                                    data.designation?.description ?? '',
                                createdBy: data.designation!.createdBy!,
                                createdAt: data.designation!.createdAt!,
                              );

                              context.read<DesignationBloc>().add(
                                    DesignationEvent.updateDesignation(
                                        updateDesigantion),
                                  );
                              context.pop();
                            },
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return Button.filled(
                                onPressed: () {
                                  final dataRequest = DesignationRequestModel(
                                    designationName:
                                        designationNameController.text,
                                    description: descriptionController.text,
                                  );

                                  context.read<DesignationBloc>().add(
                                        DesignationEvent.edit(
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
