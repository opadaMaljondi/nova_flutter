import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, Unit>> addFavorite({
    required int id,
  });
  Future<Either<Failure, Unit>> removeFavorite({
    required int id,
  });
}
