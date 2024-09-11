import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_state/core/constants/app_themes.dart';
import 'package:real_state/core/services/router_service.dart';
import 'package:real_state/core/translations/codegen_loader.g.dart';
import 'package:real_state/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:real_state/injection_container.dart';

void main() async {
  await initSettings();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (c) =>
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar'), Locale('tr')],
      path: 'assets/translations',
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
    // ),
  );
}

Future<void> initSettings() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await EasyLocalization.ensureInitialized();
  await InjectionContainer.initAppDependencies();
  // await InjectionContainer.getIt<FirebaseMessagingService>().initNotificationsSettings();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final designSize = const Size(390, 850);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: (fontSize, instance) {
        final display = View.of(context).display;
        final screenSize = display.size / display.devicePixelRatio;
        final scaleWidth = screenSize.width / designSize.width;
        return fontSize * scaleWidth;
      },
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InjectionContainer.getIt<MainCubit>(),
          ),
        ],
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return MaterialApp.router(
              title: 'APC PRIME',
              localizationsDelegates: [
                ...context.localizationDelegates,
                CountryLocalizations.delegate,
              ],
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              routerConfig: InjectionContainer.getIt<RouterService>().router,
              builder: EasyLoading.init(),
              // themeMode: context.read<MainCubit>().currentThemeMode,
              theme: AppThemes.themeEnglish,
              themeMode: ThemeMode.light,
              darkTheme: AppThemes.darkThemeEnglish,
            );
          },
        ),
      ),
    );
  }
}
