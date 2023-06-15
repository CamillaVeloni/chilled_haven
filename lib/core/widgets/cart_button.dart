import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/pages/home/controller.dart';
import 'ficon_button.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FIconButton(
      onPressed: HomeController.to.navigateToCart,
      icon: const Icon(CupertinoIcons.cart, color: Colors.black87,),
    );
  }
}
