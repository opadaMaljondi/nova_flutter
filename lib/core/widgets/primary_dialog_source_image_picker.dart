import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PrimaryDialogSourceImagePicker extends StatelessWidget {
  final Function(ImageSource? imageSource) onSourceImagePicked;

  const PrimaryDialogSourceImagePicker({super.key, required this.onSourceImagePicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              PrimaryIconButton(
                onPressed: () => onSourceImagePicked(ImageSource.gallery),
                padding: EdgeInsets.all(10.w),
                child: Icon(
                  Icons.image_outlined,
                  size: 35.w,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                LocaleKeys.gallery.tr(),
              )
            ],
          ),
          Column(
            children: [
              PrimaryIconButton(
                onPressed: () => onSourceImagePicked(ImageSource.camera),
                padding: EdgeInsets.all(10.w),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 35.w,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                LocaleKeys.camera.tr(),
              )
            ],
          ),
       
       
          Column(
            children: [
              PrimaryIconButton(
                onPressed: () => onSourceImagePicked(null),
                padding: EdgeInsets.all(10.w),
                child: Icon(
                  Icons.attachment_outlined,
                  size: 35.w,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                LocaleKeys.files.tr(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
