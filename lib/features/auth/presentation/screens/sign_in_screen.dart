import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:real_state/core/constants/app_assets.dart';
import 'package:real_state/core/constants/app_colors.dart';
import 'package:real_state/core/constants/app_routes.dart';
import 'package:real_state/core/helpers/regex_validator.dart';
import 'package:real_state/core/translations/local_keys.g.dart';
import 'package:real_state/core/widgets/primary_button.dart';
import 'package:real_state/core/widgets/primary_loader.dart';
import 'package:real_state/core/widgets/primary_text_field.dart';
import 'package:real_state/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:real_state/features/auth/presentation/widgets/auth_header_section.dart';
import 'package:real_state/features/auth/presentation/widgets/remember_me_and_forget_password_button.dart';
import 'package:real_state/injection_container.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => InjectionContainer.getIt<SignUpCubit>(),
          child: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const PrimaryLoader(),
                orElse: () => SingleChildScrollView(
                  child: Form(
                    key: signInFormKey,
                    child: Column(
                      children: [
                        AuthHeaderSection(
                          title: LocaleKeys.singIn.tr(),
                          iconPath: AppAssets.signIn.tr(),
                          subTitle: LocaleKeys.youCanTypeAnything.tr(),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        PrimaryTextField(
                          labelText: LocaleKeys.phoneNumber.tr(),
                          inputType: TextInputType.phone,
                          labelIcon: SvgPicture.asset(AppAssets.phone),
                          validator: (value) => RegexValidator.validatePhone(value),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        PrimaryTextField(
                          labelText: LocaleKeys.password.tr(),
                          labelIcon: SvgPicture.asset(AppAssets.password),
                          validator: (value) => RegexValidator.validateRequired(value),
                          isObscureText: true,
                        ),
                        const RememberMeAndForgetPasswordButton(),
                        PrimaryButton(
                          label: LocaleKeys.singIn.tr(),
                          onPressed: () {
                            context.read<SignUpCubit>().signUpWithWhatsapp();
                            // if (!signInFormKey.currentState!.validate()) return;
                            // RouterService.setInitialRoute(AppRoutes.mainScreen);
                            // context.go(AppRoutes.mainScreen);
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        PrimaryButton(
                          label: LocaleKeys.createNewAccount.tr(),
                          backgroundColor: AppColors.black,
                          onPressed: () {
                            context.push(AppRoutes.signUpScreen);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
