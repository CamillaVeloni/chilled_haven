import 'package:chilled_haven/core/models/product_rest_model.dart';
import 'package:chilled_haven/core/theme/custom_text_style.dart';
import 'package:chilled_haven/core/widgets/card_item.dart';
import 'package:chilled_haven/pages/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/cached_image.dart';
import '../../../core/widgets/ficon_button.dart';
import '../../../core/widgets/product_price.dart';

class CategorySection extends StatelessWidget {
  final String categoryName;
  final List<ProductRestModel> categoryProduct;
  final bool isFirst;

  const CategorySection({
    Key? key,
    required this.categoryProduct,
    required this.isFirst,
    required this.categoryName,
  }) : super(key: key);

  Widget get _getTileHeader => Container(
        padding: EdgeInsets.symmetric(
          vertical: isFirst ? 24: 12,
        ),
        child: Text(
          categoryName,
          style: headerStyle,
        ),
      );

  Widget get _getMenuTile => Column(
        children: List.generate(
          categoryProduct.length,
          (index) {
            final prod = categoryProduct[index];
            bool isLastIndex = index == categoryProduct.length - 1;
            return _buildFoodTile(
              prod: prod,
              isLastIndex: isLastIndex,
              onTap: () => HomeController.to.navigateToDetailPage(prod),
            );
          },
        ),
      );

  Widget _buildFoodTile({
    required bool isLastIndex,
    required ProductRestModel prod,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: CardItem(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedImage(
              image: prod.image,
              width: Get.width * 0.20,
              height: Get.width * 0.18,
            ),
            const SizedBox(width: 12),
            _buildFoodDetail(prod: prod),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodDetail({
    required ProductRestModel prod,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(prod.name, style: minBoldStyle),
          const SizedBox(height: 4),
          Text(
            prod.description,
            style: minStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ProductPrice(
                price: prod.price,
                discountPrice: prod.discountPrice,
                showDiscountPrice: prod.discountPrice != null,
              ),
              FIconButton(
                onPressed: () => CartController.to.addProductToCart(prod),
                backgroundColor: Colors.white,
                icon: const Icon(CupertinoIcons.add),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTileHeader,
          _getMenuTile,
        ],
      ),
    );
  }
}
