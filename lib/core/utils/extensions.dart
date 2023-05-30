import 'package:get/get.dart';

extension ResponsiveText on double {
  double get sp => Get.width / 100 * (this / 3);
}

extension PriceText on double {
  String get toPrice => 'R\$${toPrecision(2)}';
}
