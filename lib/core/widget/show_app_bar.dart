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
    titleSpacing: 12,
    title: Text(title, style: TextStyles.bold19),
    leading: Visibility(
      visible: isBack,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 12),
        child: Visibility(
          visible: showNotification,
          child: NotificationWidget(),
        ),
      ),
    ],
  );
}
