import '../../../../utils/common_import.dart';
import '../../../../utils/extension/theme_extension.dart';

class CustomTextField extends HookConsumerWidget {
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
    this.controller,
    this.hasDeleteAll = false,
    this.intialValue,
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
  final TextEditingController? controller;
  final bool? hasDeleteAll;
  final String? intialValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTextNotEmpty = useState(controller?.text.isNotEmpty ?? false);

    useEffect(() {
      void listener() {
        isTextNotEmpty.value = controller?.text.isNotEmpty ?? false;
      }

      controller?.addListener(listener);
      return () => controller?.removeListener(listener);
    }, [controller]);

    Widget? finalSuffixIcon;
    if (hasDeleteAll == true && isTextNotEmpty.value) {
      final deleteButton = IconButton(
        onPressed: () {
          controller?.clear();
          isTextNotEmpty.value = false;
        },
        padding: EdgeInsets.zero,
        highlightColor: AppColors.transparent,
        icon: Container(
          padding: const EdgeInsets.all(AppDimensions.paddingXXS),
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(AppDimensions.radiusS),
          ),
          child: const Icon(
            Icons.clear,
            color: AppColors.white,
            size: 20,
          ),
        ),
      );

      if (suffixIcon != null) {
        finalSuffixIcon = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            suffixIcon!,
            const SizedBox(width: AppDimensions.spacing5),
            deleteButton,
          ],
        );
      } else {
        finalSuffixIcon = deleteButton;
      }
    } else {
      finalSuffixIcon = suffixIcon ?? const SizedBox.shrink();
    }

    return hasLabel
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(labelText ?? ""),
              const SizedBox(height: AppDimensions.spacing5),
              TextFormField(
                initialValue: intialValue,
                onTap: onTap,
                onChanged: (value) {
                  isTextNotEmpty.value = value.isNotEmpty;
                  onChanged?.call(value);
                },
                controller: controller,
                obscureText: obscureText,
                textInputAction: textInputAction,
                style: context.theme.textTheme.titleMedium?.copyWith(
                  color: AppColors.black,
                  fontSize: AppDimensions.fontSizeM,
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  suffixIcon: finalSuffixIcon,
                ),
                keyboardType: keyboardType,
              ),
            ],
          )
        : TextFormField(
            initialValue: intialValue,
            onTap: onTap,
            onChanged: (value) {
              isTextNotEmpty.value = value.isNotEmpty;
              onChanged?.call(value);
            },
            controller: controller,
            obscureText: obscureText,
            textInputAction: textInputAction,
            style: context.theme.textTheme.titleMedium?.copyWith(
              color: AppColors.black,
              fontSize: AppDimensions.fontSizeM,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: finalSuffixIcon,
            ),
            keyboardType: keyboardType,
          );
  }
}
