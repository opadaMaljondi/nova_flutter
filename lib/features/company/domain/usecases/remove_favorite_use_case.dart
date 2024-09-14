import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/company/domain/repository/favorite_repo.dart';

class RemoveFavoriteUseCase {
  final FavoriteRepo favoriteRepo;

  RemoveFavoriteUseCase({required this.favoriteRepo});

  Future<Either<Failure, Unit>> call({
    required int id,
  }) async {
    return await favoriteRepo.removeFavorite(id: id);
  }
}
