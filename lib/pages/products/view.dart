import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '/core/data/categories_data.dart';
import 'sliver_scroll_controller.dart';
import 'widgets/category_section.dart';
import 'widgets/custom_app_bar.dart';

import 'controller.dart';

class ProductsPage extends GetView<ProductsController> {
  const ProductsPage({Key? key}) : super(key: key);

  Widget _getAppBar(SliverScrollController sliverController) => CustomAppBar(
        data: CATEGORIES_DATA,
        context: Get.context!,
        scrollController: sliverController.scrollController,
        expandedHeight: sliverController.expandedHeight,
        collapsedHeight: sliverController.collapsedHeight,
        isCollapsed: sliverController.isCollapsed,
        onCollapsed: sliverController.onCollapsed,
        tabController: sliverController.tabController,
        onTap: (index) => sliverController.animateAndScrollTo(index),
      );

  SliverList get _getBody => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => buildMenuItem(index),
          childCount: CATEGORIES_DATA.length,
        ),
      );

  Widget buildMenuItem(int index) {
    SliverScrollController.to.itemKeys[index] = RectGetter.createGlobalKey();
    final categoryMenu = CATEGORIES_DATA.elementAt(index).values.first;

    return RectGetter(
      key: SliverScrollController.to.itemKeys[index],
      child: AutoScrollTag(
        key: ValueKey(index),
        index: index,
        controller: SliverScrollController.to.scrollController,
        child: Obx(() => CategorySection(
          categoryName: categoryMenu.capitalizeFirst!,
          isFirst: index == 0,
          categoryProduct: controller.categoryProducts(categoryMenu),
        ),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sliverScrollController =
        Get.put<SliverScrollController>(SliverScrollController());

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade100,
      body: RectGetter(
        key: sliverScrollController.listViewKey,
        child: NotificationListener<ScrollNotification>(
          onNotification: sliverScrollController.onScrollNotification,
          child: CustomScrollView(
            controller: sliverScrollController.scrollController,
            slivers: [
              _getAppBar(sliverScrollController),
              _getBody,
            ],
          ),
        ),
      ),
    );
  }
}
