import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/notification_widget.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title, bool isBack = true}) {
  return AppBar(
    actionsPadding: EdgeInsets.symmetric(horizontal: 12),
    actions: [NotificationWidget()],
    elevation: 0,
    centerTitle: true,
    title: Text(title, style: TextStyles.bold19),
    backgroundColor: Colors.transparent,
    leading: Visibility(
      visible: isBack,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFE5E5E5), width: 1.5),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
    ),
  );
}
