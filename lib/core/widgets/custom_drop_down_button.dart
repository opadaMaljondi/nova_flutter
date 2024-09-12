import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.hint,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: const Color(0xffD1D8DB).withOpacity(.34),
        borderRadius: BorderRadius.circular(26.r),
      ),
      child: DropdownButton(
        onChanged: (value) {},
        hint: Padding(
          padding: EdgeInsetsDirectional.only(end: 20.w),
          child: Text(
            hint,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.black10,
                ),
          ),
        ),
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        iconEnabledColor: Colors.black,
        iconDisabledColor: Colors.black,
        iconSize: 24.sp,
        items: [
          DropdownMenuItem(
            child: Text(
              hint,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.black10,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
