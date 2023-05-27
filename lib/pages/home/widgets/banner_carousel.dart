import 'package:chilled_haven/core/theme/custom_text_style.dart';
import 'package:flutter/material.dart';

import '../../../core/data/banners_data.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemCount: BANNERS_DATA.length,
        pageSnapping: true,
        itemBuilder: (__, int index) {
          final item = BANNERS_DATA[index];
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(item['imageUrl']!),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(12), bottomLeft: Radius.circular(12)),
                    ),
                    child: Text(item['discount']!, style: const TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item['title']!,
                        style: detailTitleText.copyWith(color: Colors.white),
                      ),
                      Text(
                        item['description']!,
                        style: minStyle.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
