import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
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
              PrimaryAppbar(
                title: LocaleKeys.notifications.tr(),
              ),
              Divider(
                thickness: 0.3,
                color: AppColors.mainGray,
                height: 30.h,
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     SizedBox(
              //       height: 150.h,
              //     ),
              //     Container(
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 60.w,
              //         vertical: 55.h,
              //       ),
              //       decoration: const BoxDecoration(
              //         color: Colors.white,
              //         shape: BoxShape.circle,
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: 10,
              //             color: Color(0x0000000D),
              //           ),
              //         ],
              //       ),
              //       child: SvgPicture.asset(
              //         width: 84.w,
              //         height: 92.h,
              //         AppAssets.greenBell,
              //       ),
              //     ),
              //     SizedBox(
              //       height: 26.h,
              //     ),
              //     Text(
              //       LocaleKeys.thereAreNoNotifications.tr(),
              //       style: Theme.of(context).textTheme.titleLarge,
              //     ),
              //     SizedBox(
              //       height: 15.h,
              //     ),
              //     Text(
              //       LocaleKeys.iHaveSeenAllNotifications.tr(),
              //       textAlign: TextAlign.center,
              //       style: Theme.of(context).textTheme.bodyLarge,
              //     ),
              //   ],
              // ),

              SizedBox(
                height: 20.h,
              ),
              const NotifcationsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
