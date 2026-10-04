import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/notification_widget.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    actions: [NotificationWidget()],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(title, style: TextStyles.bold19),
    leading: Container(
      width: 40,
      height: 40,
      color: Colors.transparent,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1.5),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.black,
          size: 20,
        ),
      ),
    ),
  );
}
