import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../utils/common_import.dart';
import '../../../../utils/extension/theme_extension.dart';
import '../../../../utils/toast_helper.dart';
import '../../../core/presentation/widgets/base_screen_content.dart';
import '../../../core/presentation/widgets/custom_back_button.dart';
import '../../../core/presentation/widgets/custom_textfield.dart';
import '../../../core/presentation/widgets/progress_hub_widget.dart';
import '../../core/domain/user_profile_response.dart';
import '../application/get_profile_notifier.dart';
import '../application/profile_state.dart';
import '../application/set_profile_notifier.dart';

class SetProfileScreen extends StatefulHookConsumerWidget {
  const SetProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SetProfileScreenState();
}

class _SetProfileScreenState extends ConsumerState<SetProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(setProfileNotifierProvider, (previous, next) {
      next.maybeWhen(
        orElse: () => false,
        success: (userProfile) {
          ToastHelper.showSuccess(message: "Profile updated successfully");
        },
        error: (error) {
          ToastHelper.showError(message: error);
        },
      );
    });

    final userProfile = ref.watch(profileStateProvider);

    final firstNameController = useTextEditingController(
      text: userProfile.firstName,
    );
    final lastNameController = useTextEditingController(
      text: userProfile.lastName,
    );
    final emailController = useTextEditingController(
      text: userProfile.email,
    );
    final phoneNumberController = useTextEditingController(
      text: userProfile.phoneNumber,
    );
    final assemblyController = useTextEditingController(
      text: userProfile.assembly,
    );
    final localityController = useTextEditingController(
      text: userProfile.locality,
    );

    return ModalProgressHUD(
      inAsyncCall: ref.watch(setProfileNotifierProvider).maybeWhen(
            orElse: () => false,
            loading: () => true,
          ),
      progressIndicator: const ProgressHubWidget(),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(),
        ),
        body: ref.watch(getProfileProvider).when(
              data: (data) {
                firstNameController.text = data.firstName ?? "";
                lastNameController.text = data.lastName ?? "";
                emailController.text = data.email ?? "";
                phoneNumberController.text = data.phoneNumber ?? "";
                assemblyController.text = data.assembly ?? "";
                localityController.text = data.locality ?? "";

                return SafeArea(
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
                                    style: context.theme.textTheme.titleLarge
                                        ?.copyWith(
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(
                                      height: AppDimensions.spacing16),
                                  Text(
                                    "Let's get to know you better!",
                                    style: context.theme.textTheme.bodyMedium,
                                  ),
                                  Text(
                                    "Please just fill the missing information to complete your profile.",
                                    style: context.theme.textTheme.bodyMedium
                                        ?.copyWith(
                                      fontSize: AppDimensions.fontSizeXXS,
                                    ),
                                  ),
                                  const SizedBox(
                                      height: AppDimensions.spacing40),
                                  CustomTextField(
                                    hasLabel: true,
                                    labelText: "First name",
                                    hintText: "Enter your first name",
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    controller: firstNameController,
                                  ),
                                  const SizedBox(
                                      height: AppDimensions.spacing10),
                                  CustomTextField(
                                    hasLabel: true,
                                    labelText: "Last name",
                                    hintText: "Enter your last name",
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    controller: lastNameController,
                                  ),
                                  const SizedBox(
                                      height: AppDimensions.spacing10),
                                  CustomTextField(
                                    hasLabel: true,
                                    labelText: "Email",
                                    hintText: "Enter your email",
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    controller: emailController,
                                  ),
                                  const SizedBox(
                                      height: AppDimensions.spacing10),
                                  CustomTextField(
                                    hasLabel: true,
                                    labelText: "Phone number",
                                    hintText: "Enter your phone number",
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    controller: phoneNumberController,
                                  ),
                                  const SizedBox(
                                      height: AppDimensions.spacing10),
                                  CustomTextField(
                                    hasLabel: true,
                                    labelText: "Assembly",
                                    hintText:
                                        "Enter your assembly name(Tsinga, etc.)",
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    controller: assemblyController,
                                  ),
                                  const SizedBox(
                                      height: AppDimensions.spacing10),
                                  CustomTextField(
                                    hasLabel: true,
                                    labelText: "Locality",
                                    hintText:
                                        "Enter your locality(Cmfi Douala, Cmfi Yaounde, etc.)",
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    controller: localityController,
                                  ),
                                  const SizedBox(
                                      height: AppDimensions.spacing40),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        final userProfile = UserProfileResponse(
                                          email: emailController.text.trim(),
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          phoneNumber:
                                              phoneNumberController.text.trim(),
                                          assembly:
                                              assemblyController.text.trim(),
                                          locality:
                                              localityController.text.trim(),
                                        );
                                        ref
                                            .read(setProfileNotifierProvider
                                                .notifier)
                                            .setProfile(userProfile);
                                        ref.invalidate(getProfileProvider);
                                      },
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
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => Center(child: const ProgressHubWidget()),
            ),
      ),
    );
  }
}
