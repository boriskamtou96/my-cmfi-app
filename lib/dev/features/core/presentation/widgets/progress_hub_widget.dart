import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../utils/common_import.dart';

class ProgressHubWidget extends StatefulWidget {
  const ProgressHubWidget({super.key});

  @override
  State<ProgressHubWidget> createState() => _ProgressHubWidgetState();
}

class _ProgressHubWidgetState extends State<ProgressHubWidget> {
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: AppColors.black,
      size: 50.0,
    );
  }
}
