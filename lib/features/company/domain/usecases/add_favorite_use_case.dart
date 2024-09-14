import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/company/domain/repository/favorite_repo.dart';

class AddFavoriteUseCase {
  final FavoriteRepo favoriteRepo;

  AddFavoriteUseCase({required this.favoriteRepo});

  Future<Either<Failure, Unit>> call({
    required int id,
  }) async {
    return await favoriteRepo.addFavorite(id: id);
  }
}
