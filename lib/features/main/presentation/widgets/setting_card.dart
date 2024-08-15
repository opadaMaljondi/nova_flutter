// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_state/core/constants/app_colors.dart';

class SettingCard extends StatefulWidget {
  final String name;
  final String iconPath;
  final bool isActive;
  final Color color;
  final void Function()? onTap;
  final void Function(bool)? onChanged;

  const SettingCard({
    super.key,
    required this.name,
    required this.iconPath,
    this.isActive = false,
    this.color = AppColors.primary,
    this.onTap,
    this.onChanged,
  });

  @override
  State<SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  late bool isActive;

  @override
  void initState() {
    isActive = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Row(
            children: [
              SvgPicture.asset(
                widget.iconPath,
                color: widget.color,
                height: 25.w,
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              widget.onChanged != null
                  ? Switch(
                      value: isActive,
                      activeColor: Theme.of(context).canvasColor,
                      inactiveThumbColor: AppColors.white,
                      inactiveTrackColor: AppColors.black10,
                      activeTrackColor: widget.color,
                      onChanged: (value) {
                        setState(() {
                          isActive = !isActive;
                          widget.onChanged?.call(isActive);
                        });
                      },
                    )
                  : Icon(
                      context.locale.languageCode != 'ar'
                          ? Icons.keyboard_arrow_right_rounded
                          : Icons.keyboard_arrow_left_rounded,
                      color: widget.color,
                      size: 30,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
