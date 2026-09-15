import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar CustomAppBar(context, {required String title}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    ),
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
    backgroundColor: Colors.white,
  );
}
