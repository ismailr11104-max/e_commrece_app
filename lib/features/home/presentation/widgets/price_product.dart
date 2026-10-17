import 'package:e_commrece_app/core/utils/app_colors.dart';
import 'package:e_commrece_app/core/utils/app_image.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_action/cart_action_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceProduct extends StatelessWidget {
  const PriceProduct({
    super.key,
    required this.cartEntities,
    required this.onPressed,
  });

  final CartEntities cartEntities;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartActionCubit, CartActionState>(
      builder: (context, state) {
        return Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 54),
                  backgroundColor: AppColors.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: onPressed,
                label: Text(
                  'اضف الى السلة ',
                  style: TextStyles.semiBold16.copyWith(color: Colors.white),
                ),
                icon: SvgPicture.asset(Assets.imagesShoppingActive),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50,
                        color: Colors.black.withValues(alpha: 0.20),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 4),
                      Text(
                        'المجموع الكلي',
                        textAlign: TextAlign.center,
                        style: TextStyles.semiBold13.copyWith(
                          color: const Color(0xFF999590),
                        ),
                      ),
                      Text(
                        '${cartEntities.calculateTotalPrice()}',
                        textAlign: TextAlign.center,
                        style: TextStyles.semiBold16.copyWith(
                          fontSize: 22,
                          color: const Color(0xFF333333),
                        ),
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
