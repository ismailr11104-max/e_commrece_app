import 'package:e_commrece_app/core/utils/app_colors.dart';
import 'package:e_commrece_app/core/utils/app_image.dart';
import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_action/cart_action_cubit.dart';
import 'package:e_commrece_app/features/shopping/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:e_commrece_app/features/shopping/presentation/widget/action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartEntities});

  final CartEntities cartEntities;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartActionCubit, CartActionState>(
      buildWhen: (previous, current) {
        if (current is CartActionUpdate) {
          if (current.cartEntity == cartEntities) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Padding(
          padding: AppSizes.horizontalP12,
          child: Row(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(cartEntities.productEntities.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 17.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartEntities.productEntities.name,
                      style: TextStyles.semiBold16.copyWith(
                        color: const Color(0xFF262626),
                      ),
                    ),
                    SizedBox(height: AppSizes.h6),
                    Text(
                      '${cartEntities.calculateTotalWeight()} كم',
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.lightSecondaryColor,
                      ),
                    ),
                    SizedBox(height: AppSizes.h6),
                    Text(
                      '${cartEntities.calculateTotalPrice()} جنيه',
                      style: TextStyles.bold16.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 74.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().removedProduct(cartEntities);
                      },
                      child: SvgPicture.asset(Assets.trash),
                    ),
                    ActionButtons(cartEntities: cartEntities),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
