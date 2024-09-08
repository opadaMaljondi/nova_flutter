import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class CustomCounter extends StatefulWidget {
  const CustomCounter({super.key});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              setState(() {
                number++;
              });
            },
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.grayMiddle,
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(26.r),
                  topStart: Radius.circular(26.r),
                ),
              ),
              child: Icon(
                CupertinoIcons.add,
                size: 28.sp,
                color: AppColors.gray,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            height: 50.h,
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
            ),
            child: Text(
              "$number",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: const Color(0xff060606).withOpacity(.23)),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              setState(() {
                number--;
              });
            },
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.grayMiddle,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(26.r),
                  bottomEnd: Radius.circular(26.r),
                ),
              ),
              child: Icon(
                CupertinoIcons.minus,
                size: 28.sp,
                color: AppColors.gray,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
