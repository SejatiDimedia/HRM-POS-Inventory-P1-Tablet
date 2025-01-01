import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../dialogs/order_payment_dialog.dart';
import '../models/product_pos_model.dart';
import '../widgets/app_bar_pos_widget.dart';
import '../widgets/menu_card.dart';
import '../widgets/product_pos_card.dart';

class DashboardPosPage extends StatefulWidget {
  const DashboardPosPage({super.key});

  @override
  State<DashboardPosPage> createState() => _DashboardPosPageState();
}

class _DashboardPosPageState extends State<DashboardPosPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  final walkInCustomers = ['Opsi A', 'Opsi B'];
  final orderTax = ['PPN (10%)', 'PPN (20%)'];
  final discounts = ['0', 10000.currencyFormatRp];
  late List<ProductPosModel> searchResult;

  @override
  void initState() {
    searchResult = posProducts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: const OrderPaymentDialog(),
        backgroundColor: AppColors.background,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBarPosWidget(title: 'CWBPOS POINTHUB'),
        ),
        body: Row(
          children: [
            Expanded(
              child: Scaffold(
                body: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Card(
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: CustomDropdown(
                                    value: walkInCustomers.first,
                                    items: walkInCustomers,
                                    label: 'Walk In Customer',
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    showLabel: false,
                                  ),
                                ),
                                const SpaceWidth(12.0),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Assets.icons.addRounded.svg(),
                                ),
                              ],
                            ),
                            const SpaceHeight(10.0),
                            SearchInput(
                              controller: searchController,
                              hintText: 'Quick search..',
                              onChanged: (value) {
                                searchResult = posProducts
                                    .where((element) => element.name
                                        .toLowerCase()
                                        .contains(searchController.text
                                            .toLowerCase()))
                                    .toList();
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SpaceHeight(16.0),
                    Card(
                      color: AppColors.white,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          dataRowMinHeight: 30.0,
                          dataRowMaxHeight: 60.0,
                          columns: [
                            DataColumn(
                              label: SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                            const DataColumn(label: Text('Product')),
                            const DataColumn(label: Text('Quantity')),
                            const DataColumn(label: Text('Subtotal')),
                            const DataColumn(label: Text('Action')),
                          ],
                          rows: searchResult.isEmpty
                              ? [
                                  const DataRow(
                                    cells: [
                                      DataCell(Row(
                                        children: [
                                          Icon(Icons.highlight_off),
                                          SpaceWidth(4.0),
                                          Text('Data tidak ditemukan..'),
                                        ],
                                      )),
                                      DataCell.empty,
                                      DataCell.empty,
                                      DataCell.empty,
                                      DataCell.empty,
                                    ],
                                  ),
                                ]
                              : searchResult
                                  .map(
                                    (item) => DataRow(cells: [
                                      DataCell(
                                        SizedBox(
                                          height: 24.0,
                                          width: 24.0,
                                          child: Checkbox(
                                            value: false,
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ),
                                      DataCell(Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(item.subtitle),
                                        ],
                                      )),
                                      DataCell(Center(
                                          child: Text('${item.quantity}'))),
                                      DataCell(Text(item.priceFormatted)),
                                      DataCell(Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.delete_outline),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon:
                                                const Icon(Icons.edit_outlined),
                                          ),
                                        ],
                                      )),
                                    ]),
                                  )
                                  .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: Card(
                  color: AppColors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: CustomDropdown(
                                value: orderTax.first,
                                items: orderTax,
                                label: 'Order Tax',
                              ),
                            ),
                            const SpaceWidth(16.0),
                            Flexible(
                              child: CustomDropdown(
                                value: discounts.first,
                                items: discounts,
                                label: 'Order Tax',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 2.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 2,
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Assets.icons.grandTotal.svg(),
                                title: Text(
                                    'Grand Total : ${1469000.currencyFormatRp}'),
                                subtitle: Text(
                                    'Tax : ${10850000.currencyFormatRp}   Discount : ${0.currencyFormatRp}'),
                              ),
                            ),
                            const SpaceWidth(16.0),
                            Flexible(
                              flex: 1,
                              child: Button.filled(
                                onPressed: () =>
                                    _scaffoldKey.currentState!.openEndDrawer(),
                                label: 'Pay Now',
                              ),
                            ),
                            const SpaceWidth(8.0),
                            Flexible(
                              flex: 1,
                              child: Button.outlined(
                                onPressed: () {},
                                label: 'Reset',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuCard(
                              imagePath: Assets.images.menu.allProduct.path,
                              title: 'All product',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.electronic.path,
                              title: 'Electronic',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.furniture.path,
                              title: 'Furniture',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.fashion.path,
                              title: 'Fashion',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.headphone.path,
                              title: 'Headphone',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.grocery.path,
                              title: 'Grocery',
                            ),
                            const SpaceWidth(16.0),
                            MenuCard(
                              imagePath: Assets.images.menu.mineral.path,
                              title: 'Mineral W',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SpaceHeight(16.0),
                    Expanded(
                      child: SingleChildScrollView(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 9 / 11,
                          ),
                          itemCount: posProducts.length,
                          itemBuilder: (context, index) => ProductPosCard(
                            item: posProducts[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
