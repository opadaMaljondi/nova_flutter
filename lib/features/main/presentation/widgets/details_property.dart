import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/custom_drop_down_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/main/presentation/widgets/custom_counter.dart';
import 'package:real_state/features/main/presentation/widgets/custom_filter_chip.dart';

class DetailsProperty extends StatelessWidget {
  const DetailsProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Divider(color: AppColors.mainGray),
              ),
              Text(
                '  Details  ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.mainGray),
              ),
              const Expanded(
                child: Divider(color: AppColors.mainGray),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            'Property code',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          PrimaryTextField(
            padding: EdgeInsets.zero,
            fillColor: const Color(0xffD1D8DB).withOpacity(.34),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Property area',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Expanded(
                child: PrimaryTextField(
                  padding: EdgeInsets.zero,
                  fillColor: const Color(0xffD1D8DB).withOpacity(.34),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              const CustomDropDownButton(
                hint: 'square meters',
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Number of bedrooms',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomCounter(),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Number of bathrooms',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomCounter(),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Number of floors',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomCounter(),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Number of parking spaces',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          const CustomCounter(),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Year of construction',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          PrimaryTextField(
            padding: EdgeInsets.zero,
            fillColor: const Color(0xffD1D8DB).withOpacity(.34),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Location on map',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 12.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              height: 190.h,
              width: double.infinity,
              fit: BoxFit.fill,
              AppAssets.estate1,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              CustomFilterChip(
                label: 'modification',
                isSelected: false,
                activeColor: AppColors.primary,
                onSelected: (value) {},
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomFilterChip(
                label: 'save',
                isSelected: true,
                activeColor: AppColors.primary,
                onSelected: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
