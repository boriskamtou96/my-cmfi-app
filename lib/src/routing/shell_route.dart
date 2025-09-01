import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../utils/common_import.dart';

class ShellRouteWidget extends HookConsumerWidget {
  const ShellRouteWidget({super.key, required this.child, required this.state});

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    final tabs = [
      ColoredImage(
          imagePath: "assets/icons/home.png",
          isSelected: state.uri.pathSegments.first == 'home'),
      ColoredImage(
          imagePath: "assets/icons/stats.png",
          isSelected: state.uri.pathSegments.first == 'stats'),
      ColoredImage(
          imagePath: "assets/icons/circle.png",
          isSelected: state.uri.pathSegments.first == 'circle'),
      ColoredImage(
          imagePath: "assets/icons/settings.png",
          isSelected: state.uri.pathSegments.first == 'settings'),
    ];

    return Scaffold(
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.green,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: AppColors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: AnimatedBottomNavigationBar.builder(
          activeIndex: currentIndex.value,
          onTap: (index) {
            switch (index) {
              case 0:
                context.go(Routes.home);
              case 1:
                context.go(Routes.stats);
              case 2:
                context.go(Routes.settings);
            }
            currentIndex.value = index;
          },
          elevation: 0,
          backgroundColor: AppColors.white,
          gapLocation: GapLocation.center,
          tabBuilder: (index, isActive) {
            return ColoredImage(
              imagePath: tabs[index].imagePath,
              isSelected: isActive,
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}

class ColoredImage extends ConsumerWidget {
  const ColoredImage(
      {super.key, required this.imagePath, required this.isSelected});

  final String imagePath;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        isSelected ? AppColors.pink : AppColors.black,
        BlendMode.srcIn,
      ),
      child: Image.asset(
        imagePath,
        width: AppDimensions.spacing24,
        height: AppDimensions.spacing24,
      ),
    );
  }
}
