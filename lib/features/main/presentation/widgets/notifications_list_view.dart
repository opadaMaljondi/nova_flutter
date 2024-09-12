import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/features/main/presentation/widgets/notifivations_list_view_item.dart';

class NotifcationsListView extends StatelessWidget {
  const NotifcationsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: 4,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 13.h,
        );
      },
      itemBuilder: (context, index) {
        return Slidable(
          useTextDirection: true,
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            extentRatio: 0.3,
            children: [
              SlidableAction(
                backgroundColor: Colors.red,
                icon: Icons.delete,
                
                autoClose: false,
                borderRadius: context.locale.languageCode == 'en'
                    ? BorderRadius.horizontal(
                        right: Radius.circular(12.r),
                      )
                    : BorderRadius.horizontal(
                        left: Radius.circular(12.r),
                      ),
                foregroundColor: AppColors.white,
                label: 'Delete',
                onPressed: (context) {},
              ),
            ],
          ),
          child: const NotificationsListViewItem(),
        );
      },
    );
  }
}
