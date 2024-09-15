import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/main/domain/entities/notification_entity.dart';
import 'package:real_state/features/main/domain/repository/main_repo.dart';

class GetNotificationsUseCase {
  final MainRepo mainRepo;

  GetNotificationsUseCase({required this.mainRepo});

  Future<Either<Failure, List<Notification>>> call() async {
    return await mainRepo.getNotifications();
  }
}
