import '../../../../../utils/common_import.dart';

class SocialAuthConnexionButtons extends StatelessWidget {
  const SocialAuthConnexionButtons({
    super.key,
    required this.onGoogleTap,
    required this.onAppleTap,
  });
  final VoidCallback onGoogleTap;
  final VoidCallback onAppleTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SocialAuthButton(
            icon: "assets/icons/google.png",
            onTap: onGoogleTap,
          ),
        ),
        const SizedBox(width: AppDimensions.spacing20),
        Expanded(
          child: SocialAuthButton(
            icon: "assets/icons/apple_dark.png",
            onTap: onAppleTap,
          ),
        ),
      ],
    );
  }
}

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.gray110,
      borderRadius: BorderRadius.circular(AppDimensions.radiusXXXL),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXXXL),
        child: Container(
          width: double.infinity,
          height: 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusXXXL),
            border: Border.all(
              color: AppColors.black.withAlpha(12),
              width: 1,
            ),
          ),
          child: Image.asset(icon),
        ),
      ),
    );
  }
}
