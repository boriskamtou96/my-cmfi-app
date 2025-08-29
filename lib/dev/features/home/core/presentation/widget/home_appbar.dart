import '../../../../../utils/common_import.dart';
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
          onTap: () {
            // await ref.read(authNotifierProvider.notifier).signOut();
            context.push(Routes.setProfile);
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
