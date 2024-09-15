import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:real_state/features/main/domain/entities/notification_entity.dart';
import 'package:real_state/features/main/domain/repository/main_repo.dart';
import 'package:real_state/injection_container.dart';

class MainRepoImpl implements MainRepo {
  final MainRemoteDataSourceImpl mainRemoteDataSourceImpl;

  const MainRepoImpl({required this.mainRemoteDataSourceImpl});

  @override
  Future<Either<Failure, List<Notification>>> getNotifications() async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `getNotifications` in |MainRepoImpl|",
      );
      final notifications = await mainRemoteDataSourceImpl.getNotifications();
      InjectionContainer.getIt<Logger>().w(
        "End `getNotifications` in |MainRepoImpl|",
      );
      return Right(notifications);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getNotifications` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(
        StateManagerService.getFailureFromException(e),
      );
    }
  }
}
