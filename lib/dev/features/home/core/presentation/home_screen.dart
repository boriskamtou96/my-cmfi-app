import 'package:date_picker_timeline/date_picker_widget.dart';

import '../../../../utils/common_import.dart';
import '../../../auth/core/infrastructure/auth_local_service.dart';
import 'widget/custom_date_picker.dart';
import 'widget/empty_report.dart';
import 'widget/home_appbar.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final DatePickerController _datePickerController = DatePickerController();

  @override
  Widget build(BuildContext context) {
    // final userFullName = ref.watch(authLocalServiceProvider).getUserFullName();
    final userProfilePicture =
        ref.watch(authLocalServiceProvider).getUserProfilePicture();

    return Scaffold(
      appBar: HomeAppBar(userProfilePicture: userProfilePicture, ref: ref),
      body: Column(
        children: [
          const SizedBox(height: AppDimensions.spacing16),
          CustomDatePicker(
            datePickerController: _datePickerController,
            onDateChange: (date) {},
          ),
          Spacer(),
          EmptyReport(),
          Spacer(),
        ],
      ),
    );
  }
}
