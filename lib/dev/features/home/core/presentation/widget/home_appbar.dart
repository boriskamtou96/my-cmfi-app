import '../../../../../utils/common_import.dart';
import '../../../../auth/core/application/auth_notifier.dart';
import 'calendar_title.dart';
import 'user_image.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.userProfilePicture,
    required this.ref,
  });

  final String? userProfilePicture;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CalendarTitle(),
      actions: [
        UserImage(
          onTap: () async {
            await ref.read(authNotifierProvider.notifier).signOut();
          },
          userProfilePicture: userProfilePicture,
        ),
        const SizedBox(width: AppDimensions.spacing16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
