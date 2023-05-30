import 'package:chilled_haven/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../../../core/theme/custom_text_style.dart';
import '../../../core/widgets/product_tile.dart';
import '../controller.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Mais vendidos', style: detailTitleText),
            GestureDetector(
              onTap: HomeController.to.navigateToProducts,
              child: Text(
                'Ver mais',
                style: minStyle.copyWith(color: Colors.grey.shade800),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        GetX<HomeController>(builder: (controller) {
          return SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: controller.viewedProducts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (__, int index) {
                final prod = controller.viewedProducts[index];
                return ProductTile(
                  name: prod.name,
                  imageUrl: prod.image,
                  price: 'R\$${prod.price}',
                  category: prod.category,
                  onTap: () => controller.navigateToDetailPage(prod),
                  onAddTap: () => CartController.to.addProductToCart(prod),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
