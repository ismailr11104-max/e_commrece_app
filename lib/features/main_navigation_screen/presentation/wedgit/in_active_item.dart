import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SvgPicture.asset(image, width: AppSizes.s20, height: AppSizes.h20),
    );
  }
}
