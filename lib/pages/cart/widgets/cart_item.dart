import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/models/cart_item_model.dart';
import '../../../core/theme/custom_text_style.dart';
import '../../../core/widgets/cached_image.dart';
import '../../../core/widgets/card_item.dart';
import '../../../core/widgets/product_price.dart';
import '../../../core/widgets/quantity_button_variant.dart';
import '../controller.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;

  const CartItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return CardItem(
        child: Row(
          children: [
            CachedImage(
              image: item.image,
              isCircular: true,
              width: Get.width * 0.20,
              height: Get.width * 0.18,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: minBoldStyle,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Obx(
                        () => ProductPrice(
                          price: item.sumPrice.value,
                          discountPrice: item.sum.value,
                          showDiscountPrice: item.discountPrice != null,
                        ),
                      ),
                      Obx(
                        () => QuantityButtonVariant(
                          onSubtract: () => controller
                              .decreaseQuantityProduct(item.productId),
                          onAdd: () => controller
                              .increaseQuantityProduct(item.productId),
                          quantity: '${item.quantity}',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
