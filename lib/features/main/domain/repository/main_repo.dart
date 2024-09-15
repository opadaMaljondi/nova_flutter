import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/main/domain/entities/notification_entity.dart';

abstract class MainRepo {
  Future<Either<Failure, List<Notification>>> getNotifications();
  Future<Either<Failure, Unit>> upgradeToBroker();
}
