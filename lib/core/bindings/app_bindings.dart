import 'package:get/get.dart';

import '/pages/index.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController());
  }
}

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}