import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/feature/domain/entities/feature_entity.dart';

abstract class FeatureRepo {
  Future<Either<Failure, List<Feature>>> getFeatures();
}
