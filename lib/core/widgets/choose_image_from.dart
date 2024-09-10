import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';

class ChooseImageFrom extends StatelessWidget {
  const ChooseImageFrom({
    super.key,
    required this.onPressed,
  });

  final void Function(ImageSource imageSource) onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryIconButton(
              padding: EdgeInsets.all(10.w),
              child: Icon(
                Icons.image_outlined,
                size: 35.w,
                color: AppColors.primary,
              ),
              onPressed: () => onPressed(ImageSource.gallery),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Gallery',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.primary,
                  ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryIconButton(
              padding: EdgeInsets.all(10.w),
              child: Icon(
                Icons.camera_alt_outlined,
                size: 35.w,
                color: AppColors.primary,
              ),
              onPressed: () => onPressed(ImageSource.camera),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Camera',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.primary,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
