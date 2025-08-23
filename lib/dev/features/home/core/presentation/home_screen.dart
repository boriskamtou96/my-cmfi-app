import 'package:date_picker_timeline/date_picker_widget.dart';

import '../../../../utils/common_import.dart';
import '../../../auth/core/application/auth_notifier.dart';
import '../../../auth/core/infrastructure/auth_local_service.dart';
import 'widget/calendar_title.dart';
import 'widget/user_image.dart';

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
      appBar: AppBar(
        title: CalendarTitle(),
        actions: [
          if (userProfilePicture != null)
            UserImage(
              onTap: () async {
                await ref.read(authNotifierProvider.notifier).signOut();
              },
              userProfilePicture: userProfilePicture,
            ),
          const SizedBox(width: AppDimensions.spacing16),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: AppDimensions.spacing16),
          DatePicker(
            height: 90,
            DateTime.now(),
            controller: _datePickerController,
            initialSelectedDate: DateTime.now(),
            dateTextStyle: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            calendarType: CalendarType.gregorianDate,
            selectionColor: AppColors.green,
            selectedTextColor: Colors.white,
            onDateChange: (date) {},
          ),
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimensions.spacing24),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/icons/empty.png',
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacing100),
                  Text(
                    'No report for this day',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondaryBlue,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacing16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add a report'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
