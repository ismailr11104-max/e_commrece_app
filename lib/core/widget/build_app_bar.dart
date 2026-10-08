import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/notification_widget.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool isBack = true,
}) {
  return AppBar(
    elevation: 0,
    actionsPadding: EdgeInsets.symmetric(horizontal: 8),
    backgroundColor: Colors.white,
    centerTitle: true,
    titleSpacing: 12,
    title: Text(title, style: TextStyles.bold19),
    leading: Visibility(
      visible: isBack,
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
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
    ),
    actions: const [
      Padding(padding: EdgeInsets.only(right: 12), child: NotificationWidget()),
    ],
  );
}
