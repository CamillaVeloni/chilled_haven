import 'package:flutter/material.dart';

import '../theme/custom_text_style.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  final double? discountPrice;
  final bool showDiscountPrice;
  final bool hasSpace;

  const ProductPrice(
      {Key? key,
      required this.price,
      this.discountPrice,
      this.hasSpace = false,
      required this.showDiscountPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showDiscountPrice
        ? Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "R\$$price",
                  style: hasSpace
                      ? subtitleTextStyle.copyWith(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        )
                      : minStyle.copyWith(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                ),
                TextSpan(
                  text: "  R\$$discountPrice",
                  style: hasSpace ? detailTitleText : minBoldStyle,
                ),
              ],
            ),
          )
        : Text(
            "R\$$price",
            style: hasSpace ? subtitleTextStyle : minStyle,
          );
  }
}
