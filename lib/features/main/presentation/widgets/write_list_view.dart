import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class WriteListView extends StatelessWidget {
  const WriteListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 20.w,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 6.w,
        );
      },
      itemBuilder: (context, index) {
        return Container(
          height: 123.h,
          width: 108.w,
          decoration: BoxDecoration(
            color: AppColors.grayAccent,
            borderRadius: BorderRadius.circular(27.r),
          ),
        );
      },
    );
  }
}
