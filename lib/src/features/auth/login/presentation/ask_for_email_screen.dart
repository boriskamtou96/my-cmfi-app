import '../../../../utils/common_import.dart';
import '../../../../utils/extension/theme_extension.dart';
import '../../../core/presentation/widgets/base_screen_content.dart';
import '../../../core/presentation/widgets/custom_back_button.dart';
import '../../../core/presentation/widgets/custom_textfield.dart';

class AskFormEmailScreen extends HookConsumerWidget {
  const AskFormEmailScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final formKey = GlobalKey<FormState>();
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "What's your\n",
                              style:
                                  context.theme.textTheme.titleLarge?.copyWith(
                                letterSpacing: 0.5,
                              ),
                            ),
                            TextSpan(
                              text: "email ",
                              style:
                                  context.theme.textTheme.titleLarge?.copyWith(
                                letterSpacing: 0.5,
                                color: AppColors.green,
                              ),
                            ),
                            TextSpan(
                              text: "address?",
                              style:
                                  context.theme.textTheme.titleLarge?.copyWith(
                                letterSpacing: 0.5,
                              ),
                            ),
                          ])),
                          const SizedBox(height: AppDimensions.spacing40),
                          const SizedBox(height: AppDimensions.spacing5),
                          CustomTextField(
                            hasDeleteAll: true,
                            labelText: "Email",
                            hasLabel: true,
                            obscureText: false,
                            controller: emailController,
                            textInputAction: TextInputAction.done,
                            hintText: "Enter your email",
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.push(Routes.login, extra: {
                            "email": emailController.text,
                          });
                          emailController.clear();
                        }
                      },
                      child: Text("Continue"),
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
