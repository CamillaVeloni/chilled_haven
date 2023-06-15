import 'package:chilled_haven/core/widgets/btn_neumorphism.dart';
import 'package:chilled_haven/core/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/custom_text_style.dart';
import '../../core/widgets/ficon_button.dart';
import '../../core/widgets/product_price.dart';
import '../../core/widgets/quantity_button.dart';
import 'controller.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 315,
              child: Stack(
                children: [
                  CachedImage(
                    image: controller.product.image,
                    width: double.infinity,
                    height: 300,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(22)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FIconButton(
                          onPressed: Get.back,
                          icon: const Icon(CupertinoIcons.back, color: Colors.black87),
                        ),
                        FIconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.heart, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => AnimatedOpacity(
                      opacity: controller.isItemInCart ? 1 : 0,
                      curve: Curves.bounceOut,
                      duration: const Duration(milliseconds: 600),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: QuantityButton(
                          onAdd: controller.increaseQuantityToCart,
                          onSubtract: controller.decreaseQuantityToCart,
                          quantity: '${controller.itemQuantity}',
                        ),
                      ),
                    ),
                  )
                  // Visibility(
                  //   visible: controller.isItemInCart,
                  //   child: Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: QuantityButton(
                  //       onAdd: () {},
                  //       onSubtract: () {},
                  //       quantity: '1',
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        controller.product.name,
                        style: detailTitleText,
                      ),
                      const SizedBox(width: 6),
                      if (controller.product.isHotSale)
                        Icon(
                          CupertinoIcons.flame_fill,
                          color: Theme.of(context).primaryColor,
                        )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(controller.product.description,
                        style: minStyle.copyWith(color: Colors.grey.shade500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductPrice(
                          price: controller.product.price,
                          discountPrice: controller.product.discountPrice,
                          showDiscountPrice:
                              controller.product.discountPrice != null,
                          hasSpace: true,
                        ),
                        BtnNeumorphism(
                          onTap: controller.addItemToCart,
                          btnBorderRadius: BorderRadius.circular(24),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Adicionar no carrinho',
                                style:
                                    minBoldStyle.copyWith(color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
