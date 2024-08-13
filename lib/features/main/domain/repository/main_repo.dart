import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/main/domain/entities/home_data_entity.dart';

abstract class MainRepo {
  Future<Either<Failure, HomeData>> getHome();
}
