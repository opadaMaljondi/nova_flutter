import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_state/core/constants/app_assets.dart';

class NotificationsListViewItem extends StatelessWidget {
  const NotificationsListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('notification_${UniqueKey()}'),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {},
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Container(
          height: 31.h,
          width: 31.w,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ),
      ),
      child: Container(
        height: 125.h,
        padding: EdgeInsets.symmetric(
          horizontal: 22.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: const [
            BoxShadow(
              blurRadius: 15,
              color: Color(0x0000000D),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  width: 21.w,
                  height: 19.h,
                  AppAssets.notifications,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  'Login process',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: const Color(0xff2E3336),
                      ),
                ),
                const Spacer(),
                Text(
                  '8 minutes ago',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: const Color(0xff2E3336),
                      ),
                ),
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Text(
              'Your account has been verified, thank you for joining us.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
