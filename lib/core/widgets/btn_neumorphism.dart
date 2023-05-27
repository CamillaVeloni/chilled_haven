import 'package:flutter/material.dart';

class BtnNeumorphism extends StatelessWidget {
  final IconData? icon;
  final Widget? child;
  final double? height;
  final double? width;
  final BorderRadius? btnBorderRadius;
  final bool isCircle;
  final bool showTwoShadows;

  const BtnNeumorphism({
    Key? key,
    this.icon,
    this.height,
    this.width,
    this.isCircle = false, this.child, this.showTwoShadows = false, this.btnBorderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: btnBorderRadius ?? BorderRadius.circular(12),
        color: Colors.red[300],
        boxShadow: [
          BoxShadow(
            color: Colors.red[200]!,
            offset: const Offset(4.0, 4.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
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
      child: child ?? Icon(
        icon,
        size: 18,
        color: Colors.grey[800],
      ),
    );
  }
}