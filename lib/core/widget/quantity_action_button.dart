import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class QuantityActionButton extends StatelessWidget {
  const QuantityActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.iconColor,
    required this.width,
    required this.height,
  });

  final IconData icon;
  final Color iconColor;
  final Color color;
  final VoidCallback onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: AppSizes.p4,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: AppSizes.borderRFull,
          ),
        ),
        child: FittedBox(child: Icon(icon, color: iconColor)),
      ),
    );
  }
}
