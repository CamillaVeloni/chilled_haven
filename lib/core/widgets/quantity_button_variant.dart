import 'package:chilled_haven/core/widgets/ficon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/custom_text_style.dart';

class QuantityButtonVariant extends StatelessWidget {
  final Function() onSubtract;
  final Function() onAdd;
  final String quantity;

  const QuantityButtonVariant(
      {Key? key,
      required this.onSubtract,
      required this.onAdd,
      required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FIconButton(
          icon: const Icon(CupertinoIcons.minus, color: Colors.white),
          onPressed: onSubtract,
          padding: EdgeInsets.zero,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(quantity, style: detailText),
        ),
        FIconButton(
          icon: const Icon(CupertinoIcons.add, color: Colors.white),
          onPressed: onAdd,
          padding: EdgeInsets.zero,
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
        ),
      ],
    );
  }
}
