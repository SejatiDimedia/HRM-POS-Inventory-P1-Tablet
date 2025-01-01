import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../core/core.dart';

class UpdateCompanyProfileSuccessDialog extends StatelessWidget {
  const UpdateCompanyProfileSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 510.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SpaceHeight(20.0),
              Assets.icons.alert.success.image(height: 104.0),
              const SpaceHeight(16.0),
              const Text(
                'Data successfully updated !',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SpaceHeight(8.0),
              const Text(
                'Congratulations! Your data has been updated successfully. Thank you for updating the information.',
                textAlign: TextAlign.center,
              ),
              const SpaceHeight(30.0),
              const SizedBox(
                width: 30.0,
                height: 30.0,
                child: LoadingIndicator(
                  indicatorType: Indicator.lineSpinFadeLoader,
                  colors: [AppColors.primary],
                  strokeWidth: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
