import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/models/product_rest_model.dart';
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

  @override
  void onReady() {
    super.onReady();
  }
}