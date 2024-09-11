import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_state/core/helpers/pickers.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/choose_image_from.dart';

class PickImageFromGalleryOrCamera extends StatefulWidget {
  const PickImageFromGalleryOrCamera({
    super.key,
    required this.onImagePicked,
  });

  final void Function(File? file)? onImagePicked;

  @override
  State<PickImageFromGalleryOrCamera> createState() =>
      _PickImageFromGalleryOrCameraState();
}

class _PickImageFromGalleryOrCameraState
    extends State<PickImageFromGalleryOrCamera> {
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.choseImageFrom.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 30.h,
            ),
            ChooseImageFrom(
              onPressed: (imageSource) async {
                if (imageSource == ImageSource.gallery) {
                  fileImage = await Pickers.pickImage(
                    ImageSource.gallery,
                  );
                  widget.onImagePicked?.call(fileImage);
                } else {
                  fileImage = await Pickers.pickImage(
                    ImageSource.camera,
                  );
                  widget.onImagePicked?.call(fileImage);
                }
              },
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
