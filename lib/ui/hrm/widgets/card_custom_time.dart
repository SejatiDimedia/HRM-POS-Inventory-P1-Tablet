import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CardCustomTime extends StatelessWidget {
  final String title;
  final Widget subtitle;
  final Color color;

  const CardCustomTime({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
              color,
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
              ),
            ),
            const SpaceHeight(4.0),
            subtitle,
          ],
        ),
      ),
    );
  }
}
