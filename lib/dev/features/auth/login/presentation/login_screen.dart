import '../../../../utils/common_import.dart';
import '../../../../utils/extension/theme_extension.dart';
import '../../../core/presentation/widgets/base_screen_content.dart';
import '../../../core/presentation/widgets/custom_back_button.dart';
import '../../../core/presentation/widgets/custom_textfield.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = useState(false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: CustomBackButton(),
      ),
      body: SafeArea(
        child: BaseScreenContent(
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            padding: const EdgeInsets.fromLTRB(
              AppDimensions.paddingM,
              AppDimensions.paddingM,
              AppDimensions.paddingM,
              AppDimensions.paddingZero,
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Log In",
                          style: context.theme.textTheme.titleLarge?.copyWith(
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.spacing16),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "Using ",
                            style: context.theme.textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: "cmfifa3narcan@gmail.com ",
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              color: AppColors.green,
                            ),
                          ),
                          TextSpan(
                            text: "to log in",
                            style: context.theme.textTheme.bodyMedium,
                          ),
                        ])),
                        const SizedBox(height: AppDimensions.spacing40),
                        const SizedBox(height: AppDimensions.spacing5),
                        CustomTextField(
                          obscureText: isPasswordVisible.value,
                          textInputAction: TextInputAction.done,
                          hintText: "Enter your password",
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              isPasswordVisible.value =
                                  !isPasswordVisible.value;
                            },
                            tooltip: isPasswordVisible.value
                                ? "Hide password"
                                : "Show password",
                            icon: Icon(
                              isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.push(Routes.setProfile),
                    child: Text("Sign up"),
                  ),
                ),
                const SizedBox(height: AppDimensions.spacing16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
