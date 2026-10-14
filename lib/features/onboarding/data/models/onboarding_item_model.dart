class OnboardingItemModel {
  final String backgroundImage;
  final String title;
  final String subTitle;

  const OnboardingItemModel({
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
  });

  static const List<OnboardingItemModel> items = [
    OnboardingItemModel(
      backgroundImage: 'assets/images/farm_Image.png',
      title: 'طازج من المزرعة إلى مائدتك',
      subTitle:
          'اكتشف تشكيلة من الخضروات والفواكه الطازجة\nالمختارة بعناية لتمنح وجباتك مذاقًا لذيذًا وانتعاشًا كل يوم.',
    ),
    OnboardingItemModel(
      backgroundImage: 'assets/images/mate.png',
      title: 'ابحث وتسوق',
      subTitle:
          'استمتع بتشكيلة من اللحوم المختارة بعناية لتحضير أشهى الوجبات ومشاركة أجمل اللحظات مع عائلتك.',
    ),

    OnboardingItemModel(
      backgroundImage: 'assets/images/order.png',
      title: 'كل احتياجاتك في طلب واحد',
      subTitle:
          'اجمع احتياجاتك من الخضروات والفواكه واللحوم في مكان واحد، واستمتع بتجربة تسوق سهلة ومريحة كل يوم.',
    ),
  ];
}
