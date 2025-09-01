import 'package:toastification/toastification.dart';

import 'common_import.dart';

class ToastHelper {
  static void showError({
    String? title,
    String? message,
  }) {
    toastification.show(
      title: title != null ? Text(title) : null,
      description: message != null ? Text(message) : null,
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.error,
      style: ToastificationStyle.minimal,
      showIcon: true,
      icon: Icon(Icons.error, color: AppColors.red),
      showProgressBar: false,
    );
  }

  static void showSuccess({
    String? title,
    String? message,
  }) {
    toastification.show(
      title: title != null ? Text(title) : null,
      description: message != null ? Text(message) : null,
      autoCloseDuration: const Duration(seconds: 3),
      type: ToastificationType.success,
      style: ToastificationStyle.minimal,
      showIcon: true,
      icon: Icon(Icons.check, color: AppColors.green),
      showProgressBar: false,
    );
  }
}
