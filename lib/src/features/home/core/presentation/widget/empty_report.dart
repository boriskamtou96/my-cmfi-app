import '../../../../../utils/common_import.dart';

class EmptyReport extends StatelessWidget {
  const EmptyReport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing24),
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
                onPressed: () {
                  context.go(Routes.cbElements);
                },
                child: const Text('Add a report'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
