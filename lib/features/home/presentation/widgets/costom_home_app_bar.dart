import 'package:e_commrece_app/core/helper_functions/get_user_data.dart';
import 'package:e_commrece_app/core/utils/app_text_styles.dart';
import 'package:e_commrece_app/core/widget/notification_widget.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/profile_image.png'),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text(
        getUser()?.name ?? 'أحمد',
        style: TextStyles.bold16.copyWith(color: Color(0xff0C0D0D)),
      ),
      trailing: NotificationWidget(),
    );
  }
}
