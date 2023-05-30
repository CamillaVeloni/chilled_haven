import 'package:get/get.dart';

import '/core/models/cart_item_model.dart';
import '/core/models/product_rest_model.dart';
import '/pages/cart/controller.dart';

class DetailsController extends GetxController {

  final ProductRestModel _product = Get.arguments;
  final _cartItem = Rxn<CartItemModel>();

  ProductRestModel get product => _product;
  bool get isItemInCart => _cartItem.value != null;
  int get itemQuantity => _cartItem.value?.quantity.value ?? 0;

  @override
  void onInit() {
    _cartItem.value = CartController.to.getItemCartItem(_product.id);
    super.onInit();
  }

  void addItemToCart() {
    CartController.to.addProductToCart(_product);
    _cartItem.value = CartController.to.getItemCartItem(_product.id);
  }
  void increaseQuantityToCart() {
    CartController.to.increaseQuantityProduct(_product.id);
    _cartItem.value = CartController.to.getItemCartItem(_product.id);
  }
  void decreaseQuantityToCart() {
    CartController.to.decreaseQuantityProduct(_product.id);
    _cartItem.value = CartController.to.getItemCartItem(_product.id);
  }

}