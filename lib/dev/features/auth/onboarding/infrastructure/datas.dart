import '../../../../utils/common_import.dart';

class OnboardingPageData {
  final String imagePath;
  final String title1;
  final String title2;
  final String description;
  final Color titleColor1;
  final Color titleColor2;

  const OnboardingPageData({
    required this.imagePath,
    required this.title1,
    required this.title2,
    required this.description,
    required this.titleColor1,
    required this.titleColor2,
  });
}

final List<OnboardingPageData> onboardingPages = [
  OnboardingPageData(
    imagePath: 'assets/images/onboarding1.png',
    title1: "Develop\n",
    title2: "good habits",
    description:
        "Habits are fundamental part of our life. Make the most of your life!",
    titleColor1: AppColors.black,
    titleColor2: AppColors.green,
  ),
  OnboardingPageData(
    imagePath: 'assets/images/onboarding2.png',
    title1: "Track your\n",
    title2: "progress",
    description:
        "Monitor your daily progress and see how your habits improve over time.",
    titleColor1: AppColors.black,
    titleColor2: AppColors.pink,
  ),
  OnboardingPageData(
    imagePath: 'assets/images/onboarding3.png',
    title1: "Break\n",
    title2: "bad habits",
    description:
        "Habits are fundamental part of our life. Make the most of your life!",
    titleColor1: AppColors.black,
    titleColor2: AppColors.green,
  ),
];
