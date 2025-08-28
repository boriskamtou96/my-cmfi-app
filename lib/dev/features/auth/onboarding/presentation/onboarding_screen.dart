import '../../../../utils/common_import.dart';
import '../../../core/infrastructure/setting_repository.dart';
import '../../../core/presentation/widgets/base_screen_content.dart';
import '../../../core/presentation/widgets/custom_richtext.dart';
import '../../core/application/auth_notifier.dart';
import '../infrastructure/datas.dart';
import 'widgets/social_auth_buttons.dart';
import 'widgets/termes_and_conditions.dart';

class OnboardingScreen extends StatefulHookConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skipToEnd() {
    _pageController.animateToPage(
      onboardingPages.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreenContent(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacing16,
                  vertical: AppDimensions.spacing16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentPage > 0)
                      TextButton(
                        onPressed: _previousPage,
                        child: Text(
                          "Previous",
                          style: GoogleFonts.poppins(
                            fontSize: AppDimensions.fontSizeS,
                            color: AppColors.secondaryBlue,
                          ),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    if (_currentPage < onboardingPages.length - 1)
                      TextButton(
                        onPressed: _skipToEnd,
                        child: Text(
                          "Skip",
                          style: GoogleFonts.poppins(
                            fontSize: AppDimensions.fontSizeS,
                            color: AppColors.secondaryBlue,
                          ),
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: onboardingPages.length,
                  itemBuilder: (context, index) {
                    final page = onboardingPages[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(flex: 2),
                        Center(
                          child: Image.asset(
                            page.imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Spacer(flex: 1),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.spacing16,
                          ),
                          child: CustomRichText(
                            text1: page.title1,
                            text2: page.title2,
                            color1: page.titleColor1,
                            color2: page.titleColor2,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.spacing12),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.spacing16,
                          ),
                          child: Text(
                            page.description,
                            style: GoogleFonts.poppins(
                              fontSize: AppDimensions.fontSizeS,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryBlue,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: AppDimensions.spacing20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacing16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      onboardingPages.length,
                      (dotIndex) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: dotIndex == _currentPage ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: dotIndex == _currentPage
                              ? AppColors.green
                              : AppColors.gray70,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.spacing24),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacing16,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: _currentPage < onboardingPages.length - 1
                          ? ElevatedButton(
                              onPressed: _nextPage,
                              child: const Text("Next"),
                            )
                          : ElevatedButton.icon(
                              onPressed: () {
                                ref
                                    .read(settingRepositoryProvider)
                                    .setOnboardingCompleted();
                                context.goNamed(Routes.register);
                              },
                              icon: Image.asset("assets/icons/envelop.png"),
                              label: const Text("Continue with Email"),
                            ),
                    ),
                    const SizedBox(height: AppDimensions.spacing20),
                    SocialAuthConnexionButtons(
                      onGoogleTap: () async {
                        ref
                            .read(settingRepositoryProvider)
                            .setOnboardingCompleted();
                        await ref
                            .read(authNotifierProvider.notifier)
                            .signInWithGoogle();
                      },
                      onAppleTap: () {
                        ref
                            .read(settingRepositoryProvider)
                            .setOnboardingCompleted();
                      },
                    ),
                    const SizedBox(height: AppDimensions.spacing20),
                    TermesAndConditions(),
                    const SizedBox(height: AppDimensions.spacing16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
