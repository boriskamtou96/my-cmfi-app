import 'package:flutter/gestures.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../utils/common_import.dart';
import '../../../../utils/extension/theme_extension.dart';
import '../../../../utils/toast_helper.dart';
import '../../../core/presentation/widgets/base_screen_content.dart';
import '../../../core/presentation/widgets/custom_textfield.dart';
import '../../../core/presentation/widgets/progress_hub_widget.dart';
import '../../core/application/auth_notifier.dart';
import '../../onboarding/presentation/widgets/social_auth_buttons.dart';

class RegisterScreen extends HookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscurePassword = useState(true);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen<AuthState>(
      authNotifierProvider,
      (previous, next) {
        next.maybeWhen(
          orElse: () {},
          authenticated: (user) {
            emailController.clear();
            passwordController.clear();
          },
          error: (error) {
            ToastHelper.showError(message: error);
          },
        );
      },
    );

    return ModalProgressHUD(
      inAsyncCall: ref.watch(authNotifierProvider).maybeMap(
            orElse: () => false,
            loading: (_) => true,
          ),
      progressIndicator: ProgressHubWidget(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
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
                            "Sign up",
                            style: context.theme.textTheme.titleLarge?.copyWith(
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.spacing16),
                          Text(
                            "Create an account to get started!",
                            style: context.theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: AppDimensions.spacing40),
                          Center(
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 100,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: AppDimensions.spacing40),
                          Text("Email"),
                          const SizedBox(height: AppDimensions.spacing5),
                          CustomTextField(
                            hintText: "Enter your email",
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            controller: emailController,
                          ),
                          const SizedBox(height: AppDimensions.spacing20),
                          Text("Password"),
                          const SizedBox(height: AppDimensions.spacing5),
                          CustomTextField(
                            obscureText: obscurePassword.value,
                            textInputAction: TextInputAction.done,
                            hintText: "Enter your password",
                            keyboardType: TextInputType.visiblePassword,
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
                            controller: passwordController,
                          ),
                          const SizedBox(height: AppDimensions.spacing40),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => ref
                                  .read(authNotifierProvider.notifier)
                                  .signUpWithEmail(
                                    emailController.text,
                                    passwordController.text,
                                  ),
                              child: Text("Sign up"),
                            ),
                          ),
                          const SizedBox(height: AppDimensions.spacing20),
                          SocialAuthConnexionButtons(
                            onGoogleTap: () async {
                              await ref
                                  .read(authNotifierProvider.notifier)
                                  .signInWithGoogle();
                            },
                            onAppleTap: () {
                              ToastHelper.showError(
                                  message:
                                      "Apple sign in is not available yet");
                            },
                          ),
                          const SizedBox(height: AppDimensions.spacing20),
                          Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Already have an account? ",
                                    style: context.theme.textTheme.bodyMedium,
                                  ),
                                  TextSpan(
                                    text: "Login",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.push(Routes.askForEmail);
                                      },
                                    style: context.theme.textTheme.bodyMedium
                                        ?.copyWith(
                                      color: AppColors.red,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
