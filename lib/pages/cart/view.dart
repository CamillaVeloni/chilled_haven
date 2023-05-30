import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

import '/core/theme/custom_text_style.dart';
import 'widgets/cart_item.dart';
import '/core/widgets/btn_neumorphism.dart';
import '/pages/cart/widgets/cart_prices_info.dart';
import '/pages/cart/widgets/user_option.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Carrinho', style: headerStyle),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        actions: [
          PopupMenuButton(
            // Callback that sets the selected popup menu item.
            onSelected: (dynamic d) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: Text('Item 1'),
              ),
              const PopupMenuItem(
                child: Text('Item 2'),
              ),
              const PopupMenuItem(
                child: Text('Item 3'),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: Get.height / 1.7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.cartItems.length,
                      itemBuilder: (__, int index) {
                        final item = controller.cartItems[index];
                        return CartItem(
                          item: item,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: Get.width * 0.15,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    const SizedBox(height: 10),
                    UserOption(
                      optionTitle: 'Local de Entrega',
                      title: controller.getUserStreet,
                      subtitle: controller.getUserAddressFormatted,
                      icon: CupertinoIcons.location_solid,
                      onTap: () {},
                    ),
                    UserOption(
                      optionTitle: 'Método de Pagamento',
                      title: 'Mastercard',
                      subtitle: '**** **** **** 4501',
                      icon: CupertinoIcons.creditcard_fill,
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    CartPricesInfo(
                      subTotal: controller.cartSubtotal,
                      deliveryCharge: DELIVERY_CHARGE,
                      sum: controller.cartSum,
                    ),
                    BtnNeumorphism(
                      onTap: controller.onSubmitOrder,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Obx(
                          () => controller.loading.value
                              ? const SizedBox(
                                  height: 20,
                                  child: CircularProgressIndicator(color: Colors.white),
                                )
                              : Text(
                                  'Fazer pedido',
                                  style: minBoldStyle.copyWith(
                                      color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
