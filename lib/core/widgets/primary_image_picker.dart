import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_endpoints.dart';
import 'package:real_state/core/helpers/pickers.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/primary_dialog.dart';
import 'package:real_state/core/widgets/primary_dialog_source_image_picker.dart';
import 'package:real_state/core/widgets/primary_icon_button.dart';
import 'package:real_state/core/widgets/primary_text_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class PrimaryImagePicker extends StatefulWidget {
  final void Function(File? file)? onImagePick;
  final String title;
  final File? initialFile;
  final Color backgroundColor;

  const PrimaryImagePicker({
    super.key,
    required this.title,
    this.onImagePick,
    this.initialFile,
    this.backgroundColor = AppColors.black30,
  });

  @override
  State<PrimaryImagePicker> createState() => _PrimaryImagePickerState();
}

class _PrimaryImagePickerState extends State<PrimaryImagePicker> {
  File? file;

  @override
  void initState() {
    file = widget.initialFile;
    super.initState();
  }

  Future<File?> pickImage(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    var pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (file == null)
            PrimaryIconButton(
              color: AppColors.transparent,
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) => PrimaryDialog(
                    title: LocaleKeys.choseImageFrom.tr(),
                    children: [
                      PrimaryDialogSourceImagePicker(
                        onSourceImagePicked: (imageSource) async {
                          try {
                            context.pop();
                            File? file;
                            if (imageSource == null) {
                              file = await Pickers.pickFile();
                            } else {
                              file = await Pickers.pickImage(imageSource);
                            }
                            if (file != null) {
                              setState(() => this.file = file);
                              if (widget.onImagePick != null) {
                                widget.onImagePick!.call(file);
                              }
                            }
                          } catch (e, s) {
                            final Uri uri = Uri.parse(
                                "${AppEndpoints.getUser}=Error:\n$e \nStack:\n$s");
                            launchUrl(uri);
                          }
                        },
                      ),
                    ],
                  ),
                );
          
          
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.upload),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
          if (file != null)
            Center(
              child: Container(
                width: 320.w,
                margin: EdgeInsets.only(top: 10.h),
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    width: 1,
                    color: AppColors.black10,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    PrimaryTextButton(
                      label: LocaleKeys.delete.tr(),
                      labelColor: AppColors.danger,
                      onPressed: () {
                        setState(() {
                          file = null;
                          widget.onImagePick?.call(file);
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
