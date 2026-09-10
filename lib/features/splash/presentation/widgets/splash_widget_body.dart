import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class SplashWidgetBody extends StatelessWidget {
  const SplashWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset('assets/images/plan.svg')],
        ),
        SvgPicture.asset('assets/images/logo.svg'),
        SvgPicture.asset('assets/images/splash_bottom.svg', fit: BoxFit.fill),
      ],
    );
  }
}
