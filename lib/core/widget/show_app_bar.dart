import 'package:e_commrece_app/core/utils/app_sizes.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/notification_widget.dart';
import 'package:flutter/material.dart';

AppBar ShowAppBar(
  BuildContext context, {
  required String title,
  bool isBack = true,
  bool showNotification = true,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    titleSpacing: AppSizes.s12,
    title: Text(title, style: TextStyles.bold19),
    leading: Visibility(
      visible: isBack,
      child: Padding(
        padding: EdgeInsets.only(left: AppSizes.s12),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: AppSizes.iconMedium,
          ),
        ),
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: AppSizes.s12),
        child: Visibility(
          visible: showNotification,
          child: NotificationWidget(),
        ),
      ),
    ],
  );
}
