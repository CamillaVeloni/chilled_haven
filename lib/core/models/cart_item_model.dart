import 'package:get/get.dart';

class CartItemModel {
  final String image;
  final String name;
  final RxInt quantity;
  final RxDouble sum;
  final RxDouble sumPrice;
  final String productId;
  final double price;
  final double? discountPrice;

  CartItemModel({
    required this.name,
    required this.image,
    required this.sumPrice,
    required this.quantity,
    required this.sum,
    required this.productId,
    required this.price,
    this.discountPrice,
  });
}
