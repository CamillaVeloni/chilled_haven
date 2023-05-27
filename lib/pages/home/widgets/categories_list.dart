import 'package:chilled_haven/core/theme/custom_text_style.dart';
import 'package:flutter/material.dart';

import '../../../core/data/categories_data.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Sabores', style: detailTitleText),
              Text('Ver mais', style: minStyle.copyWith(color: Colors.grey.shade800),)
            ],
          ),
          const SizedBox(height: 12,),
          SizedBox(
            height: 40,
            child: ListView.separated(
              itemCount: CATEGORIES_DATA.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (__, int index) {
                final category = CATEGORIES_DATA.elementAt(index);
                return OutlinedButton.icon(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade200),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                    backgroundColor: Colors.white,
                  ),
                  icon: const FlutterLogo(),
                  label: Text(category['name']!, style: minStyle.copyWith(color: Colors.grey.shade700),),
                );
              },
              separatorBuilder: (__, _) => const SizedBox(width: 5),
            ),
          ),
        ],
      ),
    );
  }
}
