import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/features/auth/presentation/widgets/account_type_card.dart';

class ChoseAccountTypeSection extends StatefulWidget {
  const ChoseAccountTypeSection({super.key});

  @override
  State<ChoseAccountTypeSection> createState() => _ChoseAccountTypeSectionState();
}

class _ChoseAccountTypeSectionState extends State<ChoseAccountTypeSection> {
  bool isOfficeAccount = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.ellipse),
              SizedBox(
                width: 10.w,
              ),
              const Text(
                'Chose account type',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              AccountTypeCard(
                label: 'Office',
                iconPath: AppAssets.office,
                isSelected: isOfficeAccount,
                onTap: () {
                  setState(() {
                    isOfficeAccount = true;
                  });
                },
              ),
              SizedBox(
                width: 10.w,
              ),
              AccountTypeCard(
                label: 'Client',
                iconPath: AppAssets.client,
                isSelected: !isOfficeAccount,
                onTap: () {
                  setState(() {
                    isOfficeAccount = false;
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
      ],
    );
  }
}
