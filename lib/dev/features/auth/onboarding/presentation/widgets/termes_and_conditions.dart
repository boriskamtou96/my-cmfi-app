import '../../../../../utils/common_import.dart';

class TermesAndConditions extends StatelessWidget {
  const TermesAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "By continuing you argree My CMFI’s\n",
            style: GoogleFonts.poppins(
              fontSize: AppDimensions.fontSizeXXSS,
              color: AppColors.secondaryBlue,
            ),
          ),
          TextSpan(
            text: "Terms of Service",
            style: GoogleFonts.poppins(
              fontSize: AppDimensions.fontSizeXXSS,
              color: AppColors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: " and ",
            style: GoogleFonts.poppins(
              fontSize: AppDimensions.fontSizeXXSS,
              color: AppColors.secondaryBlue,
            ),
          ),
          TextSpan(
            text: "Privacy Policy",
            style: GoogleFonts.poppins(
              fontSize: AppDimensions.fontSizeXXSS,
              color: AppColors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
