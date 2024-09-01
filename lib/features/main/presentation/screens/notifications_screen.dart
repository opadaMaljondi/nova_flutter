import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/notifications_list_view.dart';
import 'package:real_state/features/main/presentation/widgets/primary_appbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const PrimaryAppbar(
                title: 'Notifications',
              ),
              Divider(
                thickness: 1,
                color: AppColors.mainGray,
                height: 30.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 60.w,
                      vertical: 55.h,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color(0x0000000D),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      width: 84.w,
                      height: 92.h,
                      AppAssets.greenBell,
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    'There are no notifications here',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'I\'ve seen all your notifications',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'come back later',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const Visibility(
                visible: false,
                child: NotifcationsListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
