import '../../../../utils/common_import.dart';
import '../../../../utils/extension/theme_extension.dart';
import '../../../core/presentation/widgets/base_screen_content.dart';
import '../../../core/presentation/widgets/custom_back_button.dart';
import '../../../core/presentation/widgets/custom_textfield.dart';

class SetProfileScreen extends StatefulHookConsumerWidget {
  const SetProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SetProfileScreenState();
}

class _SetProfileScreenState extends ConsumerState<SetProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          "Complete profile",
                          style: context.theme.textTheme.titleLarge?.copyWith(
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.spacing16),
                        Text(
                          "Let's get to know you better!",
                          style: context.theme.textTheme.bodyMedium,
                        ),
                        Text(
                          "Please just fill the missing information to complete your profile.",
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                            fontSize: AppDimensions.fontSizeXXS,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.spacing40),
                        CustomTextField(
                          hasLabel: true,
                          labelText: "First name",
                          hintText: "Enter your first name",
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                        ),
                        const SizedBox(height: AppDimensions.spacing10),
                        CustomTextField(
                          hasLabel: true,
                          labelText: "Last name",
                          hintText: "Enter your last name",
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                        ),
                        const SizedBox(height: AppDimensions.spacing10),
                        CustomTextField(
                          hasLabel: true,
                          labelText: "Email",
                          hintText: "Enter your email",
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                        ),
                        const SizedBox(height: AppDimensions.spacing10),
                        CustomTextField(
                          hasLabel: true,
                          labelText: "Phone number",
                          hintText: "Enter your phone number",
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                        ),
                        const SizedBox(height: AppDimensions.spacing10),
                        CustomTextField(
                          hasLabel: true,
                          labelText: "Assembly",
                          hintText: "Enter your assembly name(Tsinga, etc.)",
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                        ),
                        const SizedBox(height: AppDimensions.spacing10),
                        CustomTextField(
                          hasLabel: true,
                          labelText: "Locality",
                          hintText:
                              "Enter your locality(Cmfi Douala, Cmfi Yaounde, etc.)",
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                        ),
                        const SizedBox(height: AppDimensions.spacing40),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => context.goNamed(Routes.home),
                            child: Text("Continue"),
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
    );
  }
}
