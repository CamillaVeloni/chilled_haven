import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/theme/custom_text_style.dart';
import '../../../core/widgets/btn_neumorphism.dart';

class SearchWidget extends StatelessWidget {
  final bool noFilterButton;
  const SearchWidget({
    super.key,
    this.noFilterButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Procurar',
                labelStyle: minStyle,
                prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey.shade500,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          const SizedBox(width: 12,),
          if (!noFilterButton) const BtnNeumorphism(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(CupertinoIcons.square_grid_2x2, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}