import 'package:datepicker_dropdown/order_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';

class DropDownDatPicker extends StatelessWidget {
  const DropDownDatPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: DropdownDatePicker(
        width: 5.w,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 24.sp,
          color: const Color(0xff060606),
        ),
        dateformatorder: OrderFormat.YMD,
        hintDay: '5',
        hintMonth: '10',
        hintYear: '2024',
        dayFlex: 2,
        monthFlex: 2,
        yearFlex: 3,
        hintTextStyle: Theme.of(context).textTheme.titleMedium,
        inputDecoration: InputDecoration(
          fillColor: AppColors.grayAccent,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27.r),
            borderSide: const BorderSide(
              color: AppColors.grayAccent,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27.r),
            borderSide: const BorderSide(
              color: AppColors.grayAccent,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27.r),
            borderSide: const BorderSide(
              color: AppColors.grayAccent,
            ),
          ),
        ),
      ),
    );
  }
}
