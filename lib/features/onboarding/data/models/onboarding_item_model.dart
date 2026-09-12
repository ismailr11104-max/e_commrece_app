class OnboardingItemModel {
  final String image;
  final String backgroundImage;
  final String title;
  final String subTitle;

  const OnboardingItemModel({
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
  });

  static const List<OnboardingItemModel> items = [
    OnboardingItemModel(
      image: 'assets/images/page_view_item1_image.svg',
      backgroundImage: 'assets/images/page_view_item1_background_image.svg',
      title: 'مرحبًا بك في HUB Fruit',
      subTitle:
          'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف\n مجموعتنا الواسعة من الفواكه الطازجة الممتازة \nواحصل على أفضل العروض والجودة العالية.',
    ),
    OnboardingItemModel(
      image: 'assets/images/page_view_item2_image.svg',
      backgroundImage: 'assets/images/page_view_item2_background_image.svg',
      title: 'ابحث وتسوق',
      subTitle:
          'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على \nالتفاصيل والصور والتقييمات لتتأكد من اختيار الفاكه\n المثالية',
    ),
  ];
}
