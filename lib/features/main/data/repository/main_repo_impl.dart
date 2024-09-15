import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/core/services/state_manager_service.dart';
import 'package:real_state/features/auth/data/models/user_model.dart';
import 'package:real_state/features/auth/domain/entities/user_entity.dart';
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

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `getUser` in |MainRepoImpl|",
      );
      final user = await mainRemoteDataSourceImpl.getUser();
      InjectionContainer.getIt<Logger>().w(
        "End `getUser` in |MainRepoImpl|",
      );
      return Right(user);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getUser` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(
        StateManagerService.getFailureFromException(e),
      );
    }
  }

  @override
  Future<Either<Failure, User>> updateProfile({
    required UserModel userModel,
    required File? photo,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `updateProfile` in |MainRepoImpl|",
      );
      final user = await mainRemoteDataSourceImpl.updateProfile(
        userModel: userModel,
        photo: photo,
      );
      InjectionContainer.getIt<Logger>().w(
        "End `updateProfile` in |MainRepoImpl|",
      );
      return Right(user);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `updateProfile` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(
        StateManagerService.getFailureFromException(e),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `logOut` in |MainRepoImpl|",
      );
      mainRemoteDataSourceImpl.logOut();
      InjectionContainer.getIt<Logger>().w(
        "End `logOut` in |MainRepoImpl|",
      );
      return const Right(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `logOut` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(
        StateManagerService.getFailureFromException(e),
      );
    }
  }
}
