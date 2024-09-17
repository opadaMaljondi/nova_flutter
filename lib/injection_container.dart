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
import 'package:real_state/features/auth/domain/usecases/sign_up_with_whatsapp_use_case.dart';
import 'package:real_state/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:real_state/features/company/data/data_sources/company_remote_data_source.dart';
import 'package:real_state/features/company/data/repository/company_repo_impl.dart';
import 'package:real_state/features/company/domain/repository/company_repo.dart';
import 'package:real_state/features/company/domain/usecases/get_companies_use_case.dart';
import 'package:real_state/features/company/presentation/cubits/get_companies_cubit/get_companies_cubit.dart';
import 'package:real_state/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:real_state/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:real_state/features/news/data/repository/feature_repo_impl.dart';
import 'package:real_state/features/news/domain/repository/news_repo.dart';
import 'package:real_state/features/news/domain/usecases/get_feature_use_case.dart';
import 'package:real_state/features/news/presentation/cubits/get_news_cubit/get_news_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class InjectionContainer {
  static GetIt getIt = GetIt.instance;

  static Future<void> initAppDependencies() async {
    await initCoreServices();
    await initAuthDependencies();
    await initCompanyDependencies();
    await initNewsDependencies();
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
      () => SignUpWithWhatsappUseCase(authRepo: getIt()),
    );

    /// Cubits and Blocs
    GetIt.instance.registerFactory(() => SignUpCubit());
  }

  static Future<void> initCompanyDependencies() async {
    /// Data Sources
    GetIt.instance.registerLazySingleton<CompanyRemoteDataSource>(
      () => CompanyRemoteDataSourceImpl(
        apiService: getIt(),
      ),
    );

    /// Repositories
    GetIt.instance.registerLazySingleton<CompanyRepo>(
      () => CompanyRepoImpl(
        companyRemoteDataSource: getIt(),
      ),
    );

    /// UseCases
    GetIt.instance.registerLazySingleton(
      () => GetCompaniesUseCase(
        companyRepo: getIt(),
      ),
    );

    /// Cubits and Blocs
    GetIt.instance.registerLazySingleton(
      () => GetCompaniesCubit(),
    );
  }

  static Future<void> initNewsDependencies() async {
    /// Data Sources
    GetIt.instance.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(
        apiService: getIt(),
      ),
    );

    /// Repositories
    GetIt.instance.registerLazySingleton<NewsRepo>(
      () => NewsRepoImpl(
        newsRemoteDataSource: getIt(),
      ),
    );

    /// UseCases
    GetIt.instance.registerLazySingleton(
      () => GetNewsUseCase(
        newsRepo: getIt(),
      ),
    );

    /// Cubits and Blocs
    GetIt.instance.registerLazySingleton(
      () => GetNewsCubit(),
    );
  }
}
