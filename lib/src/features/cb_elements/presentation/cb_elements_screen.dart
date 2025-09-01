import 'package:flutter_animate/flutter_animate.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../utils/common_import.dart';
import '../../../utils/extension/theme_extension.dart';
import '../../../utils/toast_helper.dart';
import '../../core/presentation/widgets/custom_back_button.dart';
import '../../core/presentation/widgets/progress_hub_widget.dart';
import '../application/cb_element_notifier.dart';
import '../application/set_user_selection_notifier.dart';

class CBElementsScreen extends StatefulHookConsumerWidget {
  const CBElementsScreen({super.key});

  @override
  ConsumerState<CBElementsScreen> createState() => _CBElementsScreenState();
}

class _CBElementsScreenState extends ConsumerState<CBElementsScreen>
    with TickerProviderStateMixin {
  final Set<int> selectedIndices = <int>{};

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(cbElementNotifierProvider.notifier).getCBElements();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cbElements = ref.watch(cbElementNotifierProvider);

    ref.listen(setUserSelectionNotifierProvider, (previous, next) {
      next.maybeWhen(
        orElse: () {},
        error: (error, stackTrace) =>
            ToastHelper.showError(message: error.toString()),
        data: (data) {
          ToastHelper.showSuccess(message: "Selection saved");
          context.replace(Routes.home);
        },
      );
    });

    return ModalProgressHUD(
      inAsyncCall: ref.watch(setUserSelectionNotifierProvider).maybeWhen(
            orElse: () => false,
            loading: () => true,
          ),
      progressIndicator: const ProgressHubWidget(),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.spacing16,
              right: AppDimensions.spacing16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppDimensions.spacing16),
                Text(
                  "Christian Base Elements",
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacing16),
                Text(
                  "Select the Christian Base Elements that you want to add to your report.",
                  style: context.theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: AppDimensions.spacing16),
                cbElements.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return Expanded(
                          child: const Center(child: Text("No data found")));
                    }
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: AppDimensions.spacing16,
                          children: data
                              .map(
                                (element) => Animate(
                                  delay: (100 * element.id).ms,
                                  effects: const [
                                    FadeEffect(
                                        duration: Duration(milliseconds: 500)),
                                    SlideEffect(
                                      begin: Offset(0, 0.5),
                                      duration: Duration(milliseconds: 500),
                                    ),
                                  ],
                                  child: ChoiceChip(
                                    label: Text(
                                      "${element.code} - ${element.name}",
                                      overflow: TextOverflow.ellipsis,
                                      style: context.theme.textTheme.bodyMedium
                                          ?.copyWith(
                                        fontSize: 12,
                                        color:
                                            selectedIndices.contains(element.id)
                                                ? AppColors.white
                                                : AppColors.gray50,
                                        fontWeight:
                                            selectedIndices.contains(element.id)
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                      ),
                                    ),
                                    backgroundColor: AppColors.transparent,
                                    checkmarkColor:
                                        selectedIndices.contains(element.id)
                                            ? AppColors.white
                                            : AppColors.green,
                                    selectedColor:
                                        selectedIndices.contains(element.id)
                                            ? AppColors.green
                                            : AppColors.transparent,
                                    labelStyle: context
                                        .theme.textTheme.bodyMedium
                                        ?.copyWith(
                                      color:
                                          selectedIndices.contains(element.id)
                                              ? AppColors.white
                                              : AppColors.green,
                                    ),
                                    tooltip: element.name,
                                    selected:
                                        selectedIndices.contains(element.id),
                                    onSelected: (selected) {
                                      setState(() {
                                        if (selected) {
                                          selectedIndices.add(element.id);
                                        } else {
                                          selectedIndices.remove(element.id);
                                        }
                                      });
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    );
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => Expanded(child: const ProgressHubWidget()),
                ),
                const SizedBox(height: AppDimensions.spacing16),
                if (cbElements.value != null && cbElements.value!.isNotEmpty)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(setUserSelectionNotifierProvider.notifier)
                            .setUserSelection(selectedIndices.toList());
                      },
                      child: const Text("Save"),
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
