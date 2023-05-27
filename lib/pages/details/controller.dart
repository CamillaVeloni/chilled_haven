import 'package:get/get.dart';

import '/core/models/product_rest_model.dart';

class DetailsController extends GetxController {

  final ProductRestModel _product = Get.arguments;

  ProductRestModel get product => _product;
}