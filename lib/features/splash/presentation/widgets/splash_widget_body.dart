import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashWidgetBody extends StatelessWidget {
  const SplashWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: locale.languageCode == 'ar'
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [SvgPicture.asset('assets/images/plan.svg')],
        ),
        SvgPicture.asset('assets/images/logo.svg', width: 178, height: 173),
        SvgPicture.asset('assets/images/splash_bottom.svg'),
      ],
    );
  }
}
