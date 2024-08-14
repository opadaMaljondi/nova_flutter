// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';

class PrimaryBottomNavbar extends StatelessWidget {
  final int currentTab;
  final void Function(int) changeCurrentTab;

  const PrimaryBottomNavbar({
    super.key,
    required this.currentTab,
    required this.changeCurrentTab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.black30,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: changeCurrentTab,
          selectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: AppColors.primary,
              ),
          unselectedLabelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: AppColors.black10,
              ),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primary,
          useLegacyColorScheme: true,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 5),
                child: SvgPicture.asset(
                  AppAssets.home,
                  height: 25.w,
                  color: currentTab == 0 ? AppColors.primary : AppColors.mainGray,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 5),
                child: SvgPicture.asset(
                  AppAssets.map,
                  height: 25.w,
                  color: currentTab == 1 ? AppColors.primary : AppColors.mainGray,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 5),
                child: SvgPicture.asset(
                  AppAssets.favorite,
                  height: 25.w,
                  color: AppColors.transparent,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 5),
                child: SvgPicture.asset(
                  AppAssets.favorite,
                  height: 25.w,
                  color: currentTab == 3 ? AppColors.primary : AppColors.mainGray,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 5),
                child: SvgPicture.asset(
                  AppAssets.menu,
                  height: 25.w,
                  color: currentTab == 4 ? AppColors.primary : AppColors.mainGray,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
