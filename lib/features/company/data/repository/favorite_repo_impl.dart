import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/company/data/data_sources/favorite_remote_data_source.dart';
import 'package:real_state/features/company/domain/repository/favorite_repo.dart';
import 'package:real_state/injection_container.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepoImpl({required this.favoriteRemoteDataSource});
  @override
  Future<Either<Failure, Unit>> addFavorite({required int id}) async {
    try {
      InjectionContainer.getIt<Logger>()
          .i("Start `addFavorite` in |FavoriteRepoImpl|");
      await favoriteRemoteDataSource.addFavorite(id: id);
      InjectionContainer.getIt<Logger>()
          .w("End `addFavorite` in |FavoriteRepoImpl|");
      return const Right(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `addFavorite` in |FavoriteRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(
        StateManagerService.getFailureFromException(e),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavorite({required int id}) async {
    try {
      InjectionContainer.getIt<Logger>()
          .i("Start `removeFavorite` in |FavoriteRepoImpl|");
      await favoriteRemoteDataSource.removeFavorite(id: id);
      InjectionContainer.getIt<Logger>()
          .w("End `removeFavorite` in |FavoriteRepoImpl|");
      return const Right(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `removeFavorite` in |FavoriteRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(
        StateManagerService.getFailureFromException(e),
      );
    }
  }
}
