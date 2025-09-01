import 'package:date_picker_timeline/date_picker_widget.dart';

import '../../../../../utils/common_import.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    this.onDateChange,
    required DatePickerController datePickerController,
  }) : _datePickerController = datePickerController;

  final DatePickerController _datePickerController;
  final void Function(DateTime)? onDateChange;

  @override
  Widget build(BuildContext context) {
    return DatePicker(
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
      onDateChange: onDateChange,
    );
  }
}
