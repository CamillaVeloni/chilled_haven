import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/index.dart';
import '../bindings/app_bindings.dart';
import 'constants_routers.dart';

class AppRouters {
  static List<GetPage> routes() => [
        GetPage(name: SPLASH_PAGE, page: () => const SplashPage()),
        GetPage(
          name: AUTHENTICATION_PAGE,
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: HOME_PAGE,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: PRODUCTS_PAGE,
          page: () => const ProductsPage(),
          binding: ProductsBinding(),
        ),
        GetPage(
          name: DETAIL_PAGE,
          page: () => const DetailsPage(),
          binding: DetailsBinding(),
        ),
        GetPage(
          name: CART_PAGE,
          page: () => const CartPage(),
          // binding: CartBinding(),
        ),
      ];
}
