import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: SvgPicture.asset('assets/images/notification.svg'),
      decoration: const ShapeDecoration(
        shape: OvalBorder(),
        color: Color(0xffEEF8ED),
      ),
    );
  }
}
