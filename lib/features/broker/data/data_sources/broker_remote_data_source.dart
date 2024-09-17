import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_endpoints.dart';
import 'package:real_state/core/services/api_service.dart';
import 'package:real_state/features/auth/data/models/user_model.dart';
import 'package:real_state/injection_container.dart';

abstract class BrokerRemoteDataSource {
  Future<List<UserModel>> getBrokers({String name});
  Future<Unit> upgradeToBroker();
}

class BrokerRemoteDataSourceImpl extends BrokerRemoteDataSource {
  final ApiService apiService;

  BrokerRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<UserModel>> getBrokers({String? name}) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `getBrokers` in |BrokerRemoteDataSourceImpl|",
      );

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: "${AppEndpoints.getBrokers}$name",
      );
      final borkers = mapData['users']
          .map(
            (e) => UserModel.fromJson(e),
          )
          .toList();

      InjectionContainer.getIt<Logger>().w(
        "End `getBrokers` in |BrokerRemoteDataSourceImpl|",
      );
      return Future.value(borkers);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getBrokers` in |BrokerRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
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
