import 'package:chilled_haven/core/models/product_rest_model.dart';
import 'package:chilled_haven/core/routers/constants_routers.dart';
import 'package:chilled_haven/core/theme/custom_text_style.dart';
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

  Widget get _getTileHeader => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isFirst) const Divider(),
          const SizedBox(height: 12),
          Text(
            categoryName,
            style: detailTitleText,
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 5),
        ],
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
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(4.0, 4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
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
              ProductPrice(price: prod.price, discountPrice: prod.discountPrice),
              FIconButton(
                onPressed: () {},
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
