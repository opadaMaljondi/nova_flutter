import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        return const NotificationsListViewItem();
      },
    );
  }
}
