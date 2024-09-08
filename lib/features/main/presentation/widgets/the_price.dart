import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/custom_drop_down_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';

class ThePrice extends StatelessWidget {
  const ThePrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Divider(
                  color: AppColors.mainGray,
                ),
              ),
              Text(
                '  Price  ',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.mainGray,
                    ),
              ),
              const Expanded(
                child: Divider(
                  color: AppColors.mainGray,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              const Expanded(
                child: CustomDropDownButton(
                  hint: 'monthly',
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Expanded(
                child: CustomDropDownButton(
                  hint: 'dollar',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          PrimaryTextField(
            padding: EdgeInsets.zero,
            hintText: 'value :',
            hintStyle: Theme.of(context).textTheme.bodyLarge,
            fillColor: const Color(0xffD1D8DB).withOpacity(.34),
          ),
        ],
      ),
    );
  }
}
