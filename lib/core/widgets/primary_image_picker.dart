import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_endpoints.dart';
import 'package:real_state/core/helpers/pickers.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/primary_dialog.dart';
import 'package:real_state/core/widgets/primary_dialog_source_image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

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
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 70,
                  child: SvgPicture.asset(
                    AppAssets.office,
                    height: 70.w,
                  ),
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
                                  final Uri uri = Uri.parse("${AppEndpoints.getUser}=Error:\n$e \nStack:\n$s");
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
                  backgroundImage: FileImage(file!),
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
                                  final Uri uri = Uri.parse("${AppEndpoints.getUser}=Error:\n$e \nStack:\n$s");
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
        ],
      ),
    );
  }
}
