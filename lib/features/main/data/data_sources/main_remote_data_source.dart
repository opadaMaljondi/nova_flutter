import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_endpoints.dart';
import 'package:real_state/core/services/api_service.dart';
import 'package:real_state/features/main/data/models/notification_model.dart';
import 'package:real_state/injection_container.dart';

abstract class MainRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
  Future<Unit> upgradeToBroker();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiService apiService;

  MainRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `getNotifications` in |MainRemoteDataSourceImpl|",
      );

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getNotifications,
      );
      final notificatins = mapData['Notification']
          .map(
            (e) => NotificationModel.fromJson(e),
          )
          .toList();

      InjectionContainer.getIt<Logger>().w(
        "End `getNotifications` in |MainRemoteDataSourceImpl|",
      );
      return Future.value(notificatins);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getNotifications` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<Unit> upgradeToBroker() async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `upgradeToBroker` in |MainRemoteDataSourceImpl|",
      );

      await apiService.get(
        subUrl: AppEndpoints.upgradeToBroker,
      );

      InjectionContainer.getIt<Logger>().w(
        "End `upgradeToBroker` in |MainRemoteDataSourceImpl|",
      );
      return Future.value(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `upgradeToBroker` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
