import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_colors.dart';

class AgreeButton extends StatefulWidget {
  final void Function(bool isAgree)? onChange;

  const AgreeButton({super.key, this.onChange});

  @override
  State<AgreeButton> createState() => _AgreeButtonState();
}

class _AgreeButtonState extends State<AgreeButton> {
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              isAgree = !isAgree;
              widget.onChange?.call(isAgree);
              setState(() {});
            },
            borderRadius: BorderRadius.circular(50),
            child: isAgree
                ? Radio(
                    value: 'selected',
                    groupValue: 'selected',
                    onChanged: null,
                    visualDensity: VisualDensity.compact,
                    fillColor: WidgetStateProperty.resolveWith(
                      (states) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.primary;
                        }
                        return AppColors.primary;
                      },
                    ),
                  )
                : const Radio(
                    value: 'not selected',
                    groupValue: 'selected',
                    visualDensity: VisualDensity.compact,
                    onChanged: null,
                  ),
          ),
          Text(
            'I Agree',
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(5.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2),
              child: Text(
                'policy and conditions',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
