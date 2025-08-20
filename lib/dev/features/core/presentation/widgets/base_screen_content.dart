import '../../../../utils/common_import.dart';
import 'rounded_hexagonal.dart';

class BaseScreenContent extends ConsumerWidget {
  const BaseScreenContent({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        Positioned(
          top: AppDimensions.spacing100,
          right: -AppDimensions.spacing40,
          child: RoundedHexagon(
            size: 100,
            color: AppColors.scaffoldBackgroundColorDark.withAlpha(10),
            cornerRadius: 0,
          ),
        ),
      ],
    );
  }
}
