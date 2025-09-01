import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../utils/common_import.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    required this.onTap,
    required this.userProfilePicture,
  });

  final VoidCallback onTap;
  final String? userProfilePicture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.pink,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          backgroundImage: userProfilePicture != null
              ? CachedNetworkImageProvider(userProfilePicture!)
              : AssetImage("assets/icons/user.png"),
          radius: 20,
          backgroundColor:
              userProfilePicture != null ? AppColors.gray100 : AppColors.gray50,
        ),
      ),
    );
  }
}
