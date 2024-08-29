import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_endpoints.dart';
import 'package:real_state/core/services/api_service.dart';
import 'package:real_state/features/main/data/models/home_data_model.dart';
import 'package:real_state/injection_container.dart';

abstract class MainRemoteDataSource {
  Future<HomeDataModel> getHome();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiService apiService;

  MainRemoteDataSourceImpl({required this.apiService});

  @override
  Future<HomeDataModel> getHome() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getHome` in |MainRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getUser,
      );
      final homeDataModel = HomeDataModel.fromJson(mapData['data']);

      InjectionContainer.getIt<Logger>().w("End `getHome` in |MainRemoteDataSourceImpl|");
      return Future.value(homeDataModel);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getHome` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
