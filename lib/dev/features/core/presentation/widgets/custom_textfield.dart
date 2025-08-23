import '../../../../utils/common_import.dart';
import '../../../../utils/extension/theme_extension.dart';

class CustomTextField extends ConsumerWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.obscureText,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.suffixIcon,
    this.hasLabel = false,
    this.labelText,
  });

  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Widget? suffixIcon;
  final bool hasLabel;
  final String? labelText;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return hasLabel
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(labelText ?? ""),
              const SizedBox(height: AppDimensions.spacing5),
              TextField(
                obscureText: obscureText,
                textInputAction: textInputAction,
                style: context.theme.textTheme.titleMedium?.copyWith(
                  color: AppColors.black,
                  fontSize: AppDimensions.fontSizeM,
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  suffixIcon: suffixIcon ?? const SizedBox.shrink(),
                ),
                keyboardType: keyboardType,
              ),
            ],
          )
        : TextField(
            obscureText: obscureText,
            textInputAction: textInputAction,
            style: context.theme.textTheme.titleMedium?.copyWith(
              color: AppColors.black,
              fontSize: AppDimensions.fontSizeM,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon ?? const SizedBox.shrink(),
            ),
            keyboardType: keyboardType,
          );
  }
}
