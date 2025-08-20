import '../../../utils/common_import.dart';
import '../../core/presentation/widgets/base_screen_content.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: BaseScreenContent(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 4),
              Center(
                child: Image.asset(
                  'assets/images/welcome.png',
                  fit: BoxFit.cover,
                ),
              ),
              Spacer(flex: 2),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: t.my,
                      style: GoogleFonts.poppins(
                        fontSize: AppDimensions.fontSizeL,
                        fontWeight: FontWeight.bold,
                        color: AppColors.pink,
                      ),
                    ),
                    TextSpan(
                      text: " ${t.cmfi} 😇",
                      style: GoogleFonts.poppins(
                        fontSize: AppDimensions.fontSizeL,
                        fontWeight: FontWeight.bold,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.spacing8),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "The best time to\n",
                      style: GoogleFonts.poppins(
                        fontSize: AppDimensions.fontSizeXXL,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    TextSpan(
                      text: "start is now",
                      style: GoogleFonts.poppins(
                        fontSize: AppDimensions.fontSizeXXL,
                        fontWeight: FontWeight.w600,
                        color: AppColors.green,
                      ),
                    ),
                    TextSpan(
                      text: "!",
                      style: GoogleFonts.poppins(
                        fontSize: AppDimensions.fontSizeXXL,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.spacing12),
              Text(
                "You’re taking the first step in changing your life.  Let us guide you through it.",
                style: GoogleFonts.poppins(
                  fontSize: AppDimensions.fontSizeS,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF5E6272),
                ),
              ),
              const SizedBox(height: AppDimensions.spacing24),
              ElevatedButton(
                onPressed: () => context.go(Routes.onboarding),
                child: Text("Let do it"),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
