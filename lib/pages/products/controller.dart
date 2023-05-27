import 'package:chilled_haven/core/models/product_rest_model.dart';
import 'package:get/get.dart';

import '../home/controller.dart';

class ProductsController extends GetxController {

  final _viewedProducts = <ProductRestModel>[].obs;

  List<ProductRestModel> get viewedProducts => _viewedProducts;

  List<ProductRestModel> categoryProducts(String category) => _viewedProducts.where((e) => e.category == category).toList();

  @override
  void onInit() async {
    _viewedProducts.assignAll(await HomeController.to.getProducts()); // all of it
    super.onInit();
  }

}