import 'package:get/get.dart';

import '../../core/controllers/auth_controller.dart';
import '/core/models/cart_item_model.dart';
import '/core/models/product_rest_model.dart';

const DELIVERY_CHARGE = 5.0;
class CartController extends GetxController {
  static CartController get to => Get.find();

  final loading = false.obs;
  final cartSum = DELIVERY_CHARGE.obs;
  final cartSubtotal = 0.0.obs;

  final cartItems = <CartItemModel>[].obs;

  bool get isCartEmpty => cartItems.isEmpty;

  String get getUserStreet => AuthController.to.address.street;
  String get getUserAddressFormatted =>
      '${AuthController.to.address.state} • ${AuthController.to.address.zipCode}';

  CartItemModel _generateCartItem(ProductRestModel prod, double realPrice) {
    return CartItemModel(
      image: prod.image,
      name: prod.name,
      price: prod.price,
      discountPrice: prod.discountPrice,
      productId: prod.id,
      quantity: 1.obs,
      sumPrice: prod.price.obs,
      sum: realPrice.obs,
    );
  }

  void _updateSum(double value, bool isAdding) {
    if (isAdding) {
      cartSubtotal.value += value;
      cartSum.value += value;
    } else {
      cartSubtotal.value -= value;
      cartSum.value -= value;
    }
  }

  void onSubmitOrder() async {
    if (isCartEmpty) {
      Get.snackbar("Carrinho vázio", "Adicione items no seu carrinho para fazer o pedido");
    } else {
      loading.value = true;
      await Future.delayed(const Duration(seconds: 5));
      loading.value = false;
    }
  }
  void addProductToCart(ProductRestModel product) {
    if (isItemAlreadyAdded(product.id)) {
      Get.snackbar("Já adicionado ", "${product.name} já está no seu carrinho");
    } else {
      final realPrice = product.discountPrice ?? product.price;
      final newCartItem = _generateCartItem(product, realPrice);

      cartItems.add(newCartItem);
      _updateSum(realPrice, true);
    }
  }

  void deleteProductFromCart(String id, double price) {
    cartItems.removeWhere((element) => element.productId == id);

    _updateSum(price, false);
  }

  void increaseQuantityProduct(String id) {
    final item = getItemCartItem(id)!;
    final realPrice = item.discountPrice ?? item.price;

    item.quantity.value +=1;
    item.sum.value += realPrice;
    item.sumPrice.value += item.price;
    _updateSum(realPrice, true);
  }

  void decreaseQuantityProduct(String id) {
    final item = getItemCartItem(id)!;
    final realPrice = item.discountPrice ?? item.price;
    item.quantity.value -=1;
    if (item.quantity.value == 0) {
      deleteProductFromCart(id, realPrice);
      return;
    }

    item.sum.value -= realPrice;
    item.sumPrice.value -= item.price;
    _updateSum(realPrice, false);
  }

  CartItemModel? getItemCartItem(String prodId)
  => cartItems.firstWhereOrNull((element) => element.productId == prodId);

  bool isItemAlreadyAdded(String prodId) =>
      cartItems.where((item) => item.productId == prodId)
          .isNotEmpty;

}