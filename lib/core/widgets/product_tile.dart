import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../theme/custom_text_style.dart';
import 'cached_image.dart';

class ProductTile extends StatelessWidget {
  final String name;
  final String price;
  final String category;
  final String imageUrl;
  final Function() onTap;
  const ProductTile({Key? key, required this.name, required this.price, required this.imageUrl, required this.category, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150,
            margin: const EdgeInsets.only(top: 12, left: 6, right: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name, style: minBoldStyle),
                        Text(price, style: minStyle),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12)),
                      color: Colors.red[300],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.red[100]!,
                            Colors.red[200]!,
                            Colors.red[300]!,
                            Colors.red[400]!,
                          ],
                          stops: const [
                            0.1,
                            0.3,
                            0.8,
                            1
                          ]),
                    ),
                    child: const Icon(CupertinoIcons.add, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CachedImage(
              isCircular: true,
              image: imageUrl,
              height: 110,
            ),
          ),
        ],
      ),
    );
  }
}
