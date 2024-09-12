import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/custom_drop_down_button.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/main/presentation/widgets/custom_counter.dart';
import 'package:real_state/features/main/presentation/widgets/custom_filter_chip.dart';

class DetailsProperty extends StatefulWidget {
  const DetailsProperty({super.key});

  @override
  State<DetailsProperty> createState() => _DetailsPropertyState();
}

class _DetailsPropertyState extends State<DetailsProperty> {
  @override
  bool isSelected = false;

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
                '  ${LocaleKeys.details.tr()}  ',
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
            LocaleKeys.propertyCode.tr(),
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
            LocaleKeys.propertyArea.tr(),
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
              CustomDropDownButton(
                hint: LocaleKeys.squareMeters.tr(),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            LocaleKeys.numberOfBedrooms.tr(),
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
            LocaleKeys.numberOfBathrooms.tr(),
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
            LocaleKeys.numberOfFloors.tr(),
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
            LocaleKeys.numberOfParkingSpaces.tr(),
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
            LocaleKeys.yearOfConstruction.tr(),
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
            LocaleKeys.locationOnMap.tr(),
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
                label: LocaleKeys.modification.tr(),
                isSelected: isSelected,
                activeColor: AppColors.primary,
                onSelected: (value) {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomFilterChip(
                label: LocaleKeys.save.tr(),
                isSelected: !isSelected,
                activeColor: AppColors.primary,
                onSelected: (value) {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
    ;
  }
}
