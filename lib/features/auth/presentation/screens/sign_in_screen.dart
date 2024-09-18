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
import 'package:real_state/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:real_state/features/auth/presentation/widgets/auth_header_section.dart';
import 'package:real_state/features/auth/presentation/widgets/or_divider.dart';
import 'package:real_state/features/auth/presentation/widgets/remember_me_and_forget_password_button.dart';
import 'package:real_state/injection_container.dart';

import '../widgets/social_register.dart';
import '../widgets/text_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => InjectionContainer.getIt<SignInCubit>(),
          child: BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              state.mapOrNull(
                loaded: (value) {
                  context.go(AppRoutes.mainScreen);
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const PrimaryLoader(),
                orElse: () => SingleChildScrollView(
                  child: Form(
                    key: context.read<SignInCubit>().signInFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        AuthHeaderSection(
                          title: LocaleKeys.singIn.tr(),
                          subTitle: LocaleKeys.youCanTypeAnything.tr(),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        PrimaryTextField(
                          controller:
                              context.read<SignInCubit>().emailController,
                          labelText: LocaleKeys.email.tr(),
                          inputType: TextInputType.emailAddress,
                          suffixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                          validator: (value) =>
                              RegexValidator.validateEmail(value),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        PrimaryTextField(
                          controller:
                              context.read<SignInCubit>().passwordController,
                          labelText: LocaleKeys.password.tr(),
                          validator: (value) =>
                              RegexValidator.validateRequired(value),
                          isObscureText: true,
                        ),
                        const RememberMeAndForgetPasswordButton(),
                        PrimaryButton(
                          label: LocaleKeys.singIn.tr(),
                          onPressed: () {
                            if (context
                                .read<SignInCubit>()
                                .signInFormKey
                                .currentState!
                                .validate()) {
                              context.read<SignInCubit>().signIn();
                            } else {}
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const OrDivider(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const SocialRegister(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const TextButtonAuth()
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
