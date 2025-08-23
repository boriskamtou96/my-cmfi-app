import '../../../../utils/common_import.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => context.pop(),
      padding: EdgeInsets.zero,
      highlightColor: AppColors.transparent,
      icon: Container(
        padding: const EdgeInsets.all(AppDimensions.paddingXS),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(AppDimensions.radiusS),
        ),
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
      ),
    );
  }
}
