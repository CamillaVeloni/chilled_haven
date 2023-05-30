import 'package:flutter/material.dart';

import '/core/theme/custom_text_style.dart';

class TextRow extends StatelessWidget {
  final String firstText;
  final String secondText;
  const TextRow({Key? key, required this.firstText, required this.secondText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(firstText, style: minStyle),
          Text(secondText, style: minStyle),
        ],
      ),
    );
  }
}
