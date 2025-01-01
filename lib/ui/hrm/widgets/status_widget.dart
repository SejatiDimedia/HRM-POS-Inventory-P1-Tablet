import 'package:flutter/material.dart';

import '../../../core/core.dart';

enum StatusEnum { present, leave, notMarked, absent }

class StatusWidget extends StatelessWidget {
  final String status;
  const StatusWidget(this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (status == 'present') {
        return AppColors.green;
      } else if (status == 'leave') {
        return AppColors.yellow;
      } else if (status == 'absent') {
        return AppColors.red;
      }
      return AppColors.blue;
    }

    String getText() {
      if (status == 'present') {
        return 'Present';
      } else if (status == 'leave') {
        return 'Leave';
      } else if (status == 'absent') {
        return 'Absent';
      }
      return 'Not Marked';
    }

    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: getColor().withOpacity(0.2),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Text(
        getText(),
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          color: getColor(),
        ),
      ),
    );
  }
}
