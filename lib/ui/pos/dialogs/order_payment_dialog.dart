import 'package:flutter/material.dart';

import '../../../core/core.dart';

class OrderPaymentDialog extends StatelessWidget {
  const OrderPaymentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.0,
      child: Card(
        color: AppColors.background,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Payment',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SpaceHeight(4.0),
                      Text(
                        'Walk In Customer',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(Icons.add_circle),
                          SpaceWidth(8.0),
                          Text('Add New Payment'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SpaceHeight(20.0),
              Card(
                color: AppColors.white,
                child: ListTile(
                  leading: const ClipOval(
                    child: ColoredBox(
                      color: AppColors.primary,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '01',
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: const Text('Samsung Galaxy S21'),
                  subtitle: const Text('Qty : 1'),
                  trailing: Text(
                    1230000.currencyFormatRp,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              const SpaceHeight(10.0),
              Card(
                color: AppColors.white,
                child: ListTile(
                  leading: const ClipOval(
                    child: ColoredBox(
                      color: AppColors.primary,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '02',
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: const Text('Samsung Galaxy S21'),
                  subtitle: const Text('Qty : 1'),
                  trailing: Text(
                    1230000.currencyFormatRp,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              const SpaceHeight(10.0),
              Expanded(
                child: Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text('Grand Total'),
                            const Spacer(),
                            Text(1230000.currencyFormatRp),
                          ],
                        ),
                        const SpaceHeight(16.0),
                        Row(
                          children: [
                            const Text('Tax (PPN 10%)'),
                            const Spacer(),
                            Text(123000.currencyFormatRp),
                          ],
                        ),
                        const Spacer(),
                        Button.filled(
                          onPressed: () {},
                          label: 'Complete Order',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
