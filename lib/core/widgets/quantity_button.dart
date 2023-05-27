import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/custom_text_style.dart';

class QuantityButton extends StatelessWidget {
  final Function() onSubtract;
  final Function() onAdd;
  final String quantity;

  const QuantityButton({Key? key, required this.onSubtract, required this.onAdd, required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: onSubtract,
            child: const Icon(CupertinoIcons.minus, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(quantity, style: detailText.copyWith(color: Colors.white)),
          ),
          InkWell(
            onTap: onAdd,
            child: const Icon(CupertinoIcons.add, color: Colors.white),
          )
        ],
      ),
    );
  }
}
