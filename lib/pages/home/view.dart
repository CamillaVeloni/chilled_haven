import 'package:chilled_haven/pages/home/widgets/banner_carousel.dart';
import 'package:chilled_haven/pages/home/widgets/categories_list.dart';
import 'package:chilled_haven/pages/home/widgets/products_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/auth_controller.dart';
import '../../core/widgets/cart_button.dart';
import '../../core/widgets/ficon_button.dart';
import 'widgets/search_widget.dart';
import '../../core/theme/custom_text_style.dart';
import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'Olá, ',
                        style:
                            headerNormalStyle.copyWith(color: Colors.black87),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${AuthController.to.firstName}!',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const CartButton(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('Que tipo de sorvete você gostaria de levar hoje?'),
                const SearchWidget(),
                const BannerCarousel(),
                const CategoriesList(),
                const ProductsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
