import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/extensions.dart';
import '../../../core/theme/custom_text_style.dart';
import '../../../core/widgets/text_row.dart';

class CartPricesInfo extends StatelessWidget {
  final RxDouble subTotal;
  final double deliveryCharge;
  final RxDouble sum;
  final double? discount;

  const CartPricesInfo(
      {Key? key,
      required this.subTotal,
      required this.deliveryCharge,
      required this.sum,
      this.discount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Obx(
          () => TextRow(firstText: 'Subtotal', secondText: subTotal.value.toPrice),
        ),
        TextRow(firstText: 'Taxa de entrega', secondText: deliveryCharge.toPrice),
        if (discount != null)
          TextRow(firstText: 'Disconto', secondText: 'R\$$discount'),
        const Divider(),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Total', style: minBoldStyle),
              Text(sum.value.toPrice, style: minBoldStyle),
            ],
          ),
        ),
      ],
    );
  }
}
