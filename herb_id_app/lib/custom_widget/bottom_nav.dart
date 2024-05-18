import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/svg_images.dart';
import '../common/app_constants.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar(
      {super.key,
        required this.currentPageIndex,
        required this.onDestinationSelected});

  final int currentPageIndex;
  final void Function(int) onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      // padding: const EdgeInsets.only(top: 8),
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Colors.transparent, // Changed this line
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.white24,
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF13F20E),
                  );
                } else {
                  return const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFBEBAB3),
                  );
                }
              }),
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent, // Changed this line
          height: 98,
          selectedIndex: currentPageIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(SvgImages.plant, width: 24, height: 24),
              selectedIcon: SvgPicture.asset(
                SvgImages.plant,
                width: 24,
                height: 24,
                // ignore: deprecated_member_use
                color: const Color(0xFF13F20E),
              ),
              label: AppConstants.plant,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(SvgImages.identify, width: 24, height: 24),
              selectedIcon: SvgPicture.asset(
                SvgImages.identify,
                width: 24,
                height: 24,
                // ignore: deprecated_member_use
                color: const Color(0xFF13F20E),
              ),
              label: AppConstants.identify,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(SvgImages.admin, width: 24, height: 24),
              selectedIcon: SvgPicture.asset(SvgImages.admin,
                  // ignore: deprecated_member_use
                  color: const Color(0xFF13F20E),
                  width: 24,
                  height: 24),
              label: AppConstants.admin,
            ),
            NavigationDestination(
              icon: SvgPicture.asset(SvgImages.about, width: 24, height: 24),
              selectedIcon: SvgPicture.asset(SvgImages.about,
                  // ignore: deprecated_member_use
                  color: const Color(0xFF13F20E),
                  width: 24,
                  height: 24),
              label: AppConstants.about,
            ),
          ],
        ),
      ),
    );
  }
}
