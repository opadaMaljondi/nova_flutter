import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
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

import '../constants/app_strings.dart';

class PrimaryImagePicker extends StatefulWidget {
  final void Function(File? file)? onImagePick;

  final File? initialFile;

  const PrimaryImagePicker({
    super.key,

    this.onImagePick,
    this.initialFile,
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (file == null)
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.hardEdge,
              children: [

                const CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 70,
                ),
                Positioned(
                  bottom: 0.h,
                  right: 0.w,
                  child: InkWell(
                    onTap: () {
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
                    child: SvgPicture.asset(AppAssets.camera),
                  ),
                  //
                )
              ],
            ),
          if (file != null)
            Stack(
              clipBehavior: Clip.hardEdge,
              children: [

                CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 70,
                  backgroundImage:FileImage(file!) ,
                 // child: Image.file(file!),
                  // backgroundImage:,
                ),
                Positioned(
                  bottom: 0.h,
                  right: 0.w,
                  child: InkWell(
                    onTap: () {
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
                    child: SvgPicture.asset(AppAssets.camera),
                  ),
                  //
                )
              ],
            )
          // Center(
          //   child: FittedBox(
          //     child: Container(
          //       //width: 320.w,
          //       margin: EdgeInsets.only(top: 10.h),
          //       padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8.r),
          //         border: Border.all(
          //           width: 1,
          //           color: AppColors.black10,
          //         ),
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //
          //           // PrimaryTextButton(
          //           //   label: LocaleKeys.delete.tr(),
          //           //   labelColor: AppColors.danger,
          //           //   onPressed: () {
          //           //     setState(() {
          //           //       file = null;
          //           //       widget.onImagePick?.call(file);
          //           //     });
          //           //   },
          //           // ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
