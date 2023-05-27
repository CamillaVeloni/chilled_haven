import 'package:chilled_haven/core/api/api_util.dart';
import 'package:chilled_haven/core/routers/constants_routers.dart';
import 'package:get/get.dart';

import '../../core/models/product_rest_model.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final viewedProducts = <ProductRestModel>[].obs;

  @override
  void onReady() {
    _initProducts();
    super.onReady();
  }

  Future<List<ProductRestModel>> getProducts({bool? isHotSale, String? category}) async {
    try {
      final client = await ApiUtil.getRestClient(withToken: true);
      final list = await client.getAllProducts(isHotSale, category);
      return list;
    } catch(obj) {
      ApiUtil.getRuntimeError(obj);
    }
    return [];
  }

  void changeViewedProducts({bool? isHotSale, String? category}) async {
    viewedProducts.assignAll(await getProducts(isHotSale: isHotSale, category: category));
  }

  void _initProducts() async {
    changeViewedProducts(isHotSale: true); // show first the products in hot sale
  }

  void navigateToCart() {}
  void navigateToProducts() => Get.toNamed(PRODUCTS_PAGE);
  void navigateToDetailPage(ProductRestModel prod) => Get.toNamed(DETAIL_PAGE, arguments: prod);
}