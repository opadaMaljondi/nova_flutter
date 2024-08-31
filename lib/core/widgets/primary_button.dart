import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final double? width;
  final Color backgroundColor;
  final Color labelColor;
  final IconData? prefixIcon;
  final bool isOutlined;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onPressed;
  final Color? disabledButtonColor;
  final TextStyle? style;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.prefixIcon,
    this.isOutlined = false,
    this.backgroundColor = AppColors.primary,
    this.labelColor = AppColors.white,
    this.padding,
    this.margin,
    this.disabledButtonColor,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: margin ?? EdgeInsets.symmetric(horizontal: 25.w),
      child: MaterialButton(
        onPressed: onPressed,
        color: isOutlined ? Theme.of(context).canvasColor : backgroundColor,
        disabledColor:
            disabledButtonColor ?? AppColors.mainGray.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.r),
          side:
              isOutlined ? BorderSide(color: backgroundColor) : BorderSide.none,
        ),
        elevation: isOutlined ? 0 : null,
        child: Padding(
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (prefixIcon != null) ...[
                Icon(prefixIcon),
                SizedBox(
                  width: 5.w,
                ),
              ],
              Text(
                label,
                style: style ??
                    Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: labelColor,
                          fontWeight: FontWeight.w400,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
