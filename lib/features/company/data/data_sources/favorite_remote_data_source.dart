import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_endpoints.dart';
import 'package:real_state/core/services/api_service.dart';
import 'package:real_state/injection_container.dart';

abstract class FavoriteRemoteDataSource {
  Future<Unit> addFavorite({required int id});
  Future<Unit> removeFavorite({required int id});
}

class FavotiteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final ApiService apiService;

  FavotiteRemoteDataSourceImpl({required this.apiService});
  @override
  Future<Unit> addFavorite({required int id}) async {
    try {
      InjectionContainer.getIt<Logger>()
          .i("Start `addFavorite` in |FavotiteRemoteDataSourceImpl|");

      await apiService.post(
        subUrl: '${AppEndpoints.addFavorite}$id',
      );

      InjectionContainer.getIt<Logger>()
          .w("End `addFavorite` in |FavotiteRemoteDataSourceImpl|");
      return Future.value(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `addFavorite` in |FavotiteRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<Unit> removeFavorite({required int id}) async {
    try {
      InjectionContainer.getIt<Logger>()
          .i("Start `removeFavorite` in |FavotiteRemoteDataSourceImpl|");

      await apiService.post(
        subUrl: '${AppEndpoints.removeFavorite}$id',
      );

      InjectionContainer.getIt<Logger>()
          .w("End `removeFavorite` in |FavotiteRemoteDataSourceImpl|");
      return Future.value(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `removeFavorite` in |FavotiteRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
