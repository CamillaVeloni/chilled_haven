import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final bool isCircular;
  final BorderRadius? borderRadius;
  const CachedImage({Key? key, required this.image, this.width, this.height, this.borderRadius, this.isCircular = false}) : super(key: key);

  Widget _clipImage({required Widget child}) {
    return isCircular
        ? ClipOval(child: child,)
        : ClipRRect(borderRadius: borderRadius ?? BorderRadius.circular(12), child: child,);
  }
  @override
  Widget build(BuildContext context) {
    return _clipImage(
      child: CachedNetworkImage(
        imageUrl: image,
        width: width,
        height: height,
        placeholder: (BuildContext ctx, String url) => Container(
          alignment: Alignment.center,
          child: const SizedBox(
            height: 10.0,
            width: 10.0,
            child: Center(
                child: CircularProgressIndicator()
            ),
          ),
        ),
        fit: BoxFit.cover,
        errorWidget:
            (BuildContext ctx, String url, dynamic error) => const Text('Erro'),
      ),
    );
  }
}
