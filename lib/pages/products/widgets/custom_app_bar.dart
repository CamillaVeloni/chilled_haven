import 'dart:ui';

import 'package:chilled_haven/core/theme/custom_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../core/widgets/ficon_button.dart';
import '../../home/widgets/search_widget.dart';

class CustomAppBar extends SliverAppBar {
  final Set<Map<String, String>> data;
  final BuildContext context;
  final RxBool isCollapsed;
  @override
  final double expandedHeight;
  @override
  final double collapsedHeight;
  final AutoScrollController scrollController;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;

  CustomAppBar({
    super.key,
    required this.data,
    required this.context,
    required this.isCollapsed,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.scrollController,
    required this.tabController,
    required this.onCollapsed,
    required this.onTap
  }) : super(elevation: 0, pinned: true, forceElevated: false);

  @override
  Color? get backgroundColor => Colors.grey.shade100;

  @override
  Widget? get leading {
    return Center(
      child: FIconButton(
        onPressed: Get.back,
        backgroundColor: Colors.white,
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  @override
  List<Widget>? get actions {
    return [
      Obx(
        () => Visibility(
          visible: !isCollapsed.value,
          child: FIconButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
        ),
      ),
      FIconButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        icon: const Icon(CupertinoIcons.cart),
      ),
    ];
  }

  @override
  Widget? get title {
    return Obx(
      () => AnimatedOpacity(
        opacity: isCollapsed.value ? 0 : 1,
        duration: const Duration(milliseconds: 250),
        child: Center(
          child: Text(
            'Paraiso Congelado',
            style: detailTitleText,
          ),
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Obx(
        () => !isCollapsed.value
            ? Container(
                color: Colors.white70,
                child: TabBar(
                  isScrollable: true,
                  controller: tabController,
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: 14.0),
                  indicatorColor: Colors.redAccent,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.grey,
                  indicatorWeight: 3.0,
                  tabs: data.map((e) {
                    return Tab(text: e.values.first);
                  }).toList(),
                  onTap: onTap,
                ),
              )
            : Container(),
      ),
    );
  }

  @override
  Widget? get flexibleSpace {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final top = constraints.constrainHeight();
        final collapsedHight =
            MediaQuery.of(context).viewPadding.top + kToolbarHeight + 48;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          onCollapsed(collapsedHight != top);
        });

        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SearchWidget(noFilterButton: true),
              ),
            ],
          ),
        );
      },
    );
  }
}
