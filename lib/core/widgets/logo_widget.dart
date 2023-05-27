import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double height;
  final double width;

  const LogoWidget({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.green[300]!,
            Colors.green[400]!,
            Colors.green[500]!,
            Colors.green[600]!,
          ],
          stops: const [0.1, 0.3, 0.8, 1],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    );
  }
}