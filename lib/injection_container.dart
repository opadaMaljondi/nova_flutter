import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/services/api_service.dart';
import 'package:real_state/core/services/bloc_observer_service.dart';
import 'package:real_state/core/services/caching_service.dart';
import 'package:real_state/core/services/network_info_service.dart';
import 'package:real_state/core/services/otp_less_service.dart';
import 'package:real_state/core/services/router_service.dart';
import 'package:real_state/core/services/status_showing_service.dart';
import 'package:real_state/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:real_state/features/auth/data/repository/auth_repo_impl.dart';
import 'package:real_state/features/auth/domain/repository/auth_repo.dart';
import 'package:real_state/features/auth/domain/usecases/sign_in_with_whatsapp_use_case.dart';
import 'package:real_state/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:real_state/features/feature/data/data_sources/feature_remote_data_source.dart';
import 'package:real_state/features/feature/data/repository/feature_repo_impl.dart';
import 'package:real_state/features/feature/domain/repository/feature_repo.dart';
import 'package:real_state/features/feature/domain/usecases/get_feature_use_case.dart';
import 'package:real_state/features/feature/presentation/cubits/feature_cubit/feature_cubit.dart';
import 'package:real_state/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class InjectionContainer {
  static GetIt getIt = GetIt.instance;

  static Future<void> initAppDependencies() async {
    await initCoreServices();
    await initAuthDependencies();
    await initFeatureDependencies();
  }

  static Future<void> initCoreServices() async {
    /// Helper Services
    GetIt.instance.registerSingleton(Logger());
    GetIt.instance.registerSingleton(StatusShowingService());
    GetIt.instance.registerSingleton(BlocObserverService());
    Bloc.observer = getIt<BlocObserverService>();

    /// Cache Services
    var perf = await SharedPreferences.getInstance();
    GetIt.instance.registerSingleton<SharedPreferences>(perf);
    GetIt.instance.registerSingleton<CacheService>(
      CacheServiceImpl(
        pref: getIt<SharedPreferences>(),
      ),
    );

    /// API Services
    GetIt.instance.registerSingleton(InternetConnectionChecker());
    GetIt.instance.registerSingleton<NetworkInfoService>(
      NetworkInfoServiceImpl(
        getIt<InternetConnectionChecker>(),
      ),
    );
    GetIt.instance.registerSingleton(Client());
    GetIt.instance.registerSingleton<ApiService>(
      ApiServiceImpl(
        client: getIt<Client>(),
        networkInfo: getIt<NetworkInfoService>(),
        cacheService: getIt<CacheService>(),
      ),
    );

    /// Router Services
    GetIt.instance.registerSingleton<RouterService>(
      RouterService(
        cacheService: getIt<CacheService>(),
      ),
    );

    /// Otp Less Service
    GetIt.instance.registerSingleton<OtpLessService>(
      OtpLessServiceImpl(),
    );

    GetIt.instance.registerFactory(() => MainCubit());
  }

  static Future<void> initAuthDependencies() async {
    /// Data Sources
    GetIt.instance.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        apiService: getIt(),
        otpLessService: getIt(),
      ),
    );

    /// Repositories
    GetIt.instance.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(
        authRemoteDataSource: getIt(),
      ),
    );

    /// UseCases
    GetIt.instance.registerLazySingleton(
      () => SignInWithWhatsappUseCase(authRepo: getIt()),
    );

    /// Cubits and Blocs
    GetIt.instance.registerFactory(() => SignUpCubit());
  }

  static Future<void> initFeatureDependencies() async {
    /// Data Sources
    GetIt.instance.registerLazySingleton<FeatureRemoteDataSource>(
      () => FeatureRemoteDataSourceImpl(
        apiService: getIt(),
      ),
    );

    /// Repositories
    GetIt.instance.registerLazySingleton<FeatureRepo>(
      () => FeatureRepoImpl(
        featureRemoteDataSource: getIt(),
      ),
    );

    /// UseCases
    GetIt.instance.registerLazySingleton(
      () => GetFeaturesUseCase(featureRepo: getIt()),
    );

    /// Cubits and Blocs
    GetIt.instance.registerFactory(() => FeatureCubit());
  }
}
