import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../utils/common_import.dart';
import '../../../../utils/extension/theme_extension.dart';
import '../../../../utils/toast_helper.dart';
import '../../../core/presentation/widgets/base_screen_content.dart';
import '../../../core/presentation/widgets/custom_back_button.dart';
import '../../../core/presentation/widgets/custom_textfield.dart';
import '../../../core/presentation/widgets/progress_hub_widget.dart';
import '../../core/application/auth_notifier.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscurePassword = useState(true);
    final passwordController = useTextEditingController();
    ref.listen<AuthState>(
      authNotifierProvider,
      (previous, next) {
        next.maybeWhen(
          orElse: () {},
          authenticated: (user) {
            passwordController.clear();
            ToastHelper.showSuccess(message: "Login successful");
          },
          error: (error) {
            ToastHelper.showError(message: error);
          },
        );
      },
    );
    return ModalProgressHUD(
      inAsyncCall: ref.watch(authNotifierProvider).maybeWhen(
            orElse: () => false,
            loading: () => true,
          ),
      progressIndicator: const ProgressHubWidget(),
      child: Scaffold(
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
                              text: email,
                              style:
                                  context.theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.green,
                              ),
                            ),
                            TextSpan(
                              text: " to log in",
                              style: context.theme.textTheme.bodyMedium,
                            ),
                          ])),
                          const SizedBox(height: AppDimensions.spacing40),
                          const SizedBox(height: AppDimensions.spacing5),
                          CustomTextField(
                            controller: passwordController,
                            obscureText: obscurePassword.value,
                            textInputAction: TextInputAction.done,
                            hintText: "Enter your password",
                            keyboardType: TextInputType.visiblePassword,
                            hasDeleteAll: true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                obscurePassword.value = !obscurePassword.value;
                              },
                              tooltip: obscurePassword.value
                                  ? "Hide password"
                                  : "Show password",
                              icon: Icon(
                                obscurePassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () async => await ref
                                  .read(authNotifierProvider.notifier)
                                  .forgotPassword(email),
                              child: Text("Forgot password?"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => ref
                          .read(authNotifierProvider.notifier)
                          .signInWithEmail(
                            email,
                            passwordController.text,
                          ),
                      child: Text("Sign In"),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacing16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
