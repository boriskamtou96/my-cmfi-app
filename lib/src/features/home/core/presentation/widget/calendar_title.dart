import 'package:intl/intl.dart';

import '../../../../../utils/common_import.dart';
import '../../../../../utils/extension/theme_extension.dart';

class CalendarTitle extends StatelessWidget {
  const CalendarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(AppDimensions.spacing4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusS),
            color: AppColors.green,
          ),
          child: Image.asset(
            'assets/icons/calendar.png',
            width: 30,
            height: 30,
          ),
        ),
        const SizedBox(width: AppDimensions.spacing14),
        Text(
          DateFormat('dd MMM, yyyy').format(DateTime.now()),
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
