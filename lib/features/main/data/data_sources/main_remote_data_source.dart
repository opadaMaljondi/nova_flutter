import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:real_state/core/constants/app_endpoints.dart';
import 'package:real_state/core/services/api_service.dart';
import 'package:real_state/features/auth/data/models/user_model.dart';
import 'package:real_state/features/main/data/models/notification_model.dart';
import 'package:real_state/injection_container.dart';

abstract class MainRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
  Future<UserModel> getUser();
  Future<Unit> logOut();

  Future<UserModel> updateProfile({
    required UserModel userModel,
    required File? photo,
  });
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiService apiService;

  MainRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `getNotifications` in |MainRemoteDataSourceImpl|",
      );

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getNotifications,
      );
      final notificatins = mapData['Notification']
          .map(
            (e) => NotificationModel.fromJson(e),
          )
          .toList();

      InjectionContainer.getIt<Logger>().w(
        "End `getNotifications` in |MainRemoteDataSourceImpl|",
      );
      return Future.value(notificatins);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getNotifications` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `getUser` in |MainRemoteDataSourceImpl|",
      );

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getUser,
      );
      final user = mapData['user'];

      InjectionContainer.getIt<Logger>().w(
        "End `getUser` in |MainRemoteDataSourceImpl|",
      );
      return Future.value(user);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getUser` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<UserModel> updateProfile({
    required UserModel userModel,
    required File? photo,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `updateProfile` in |MainRemoteDataSourceImpl|",
      );

      Map<String, dynamic> mapData = await apiService.post(
        subUrl: AppEndpoints.updateProfile,
        data: userModel.toJson(),
        files: [
          FileField(
            name: 'photo',
            file: photo,
          ),
        ],
      );
      final user = mapData['data'];

      InjectionContainer.getIt<Logger>().w(
        "End `updateProfile` in |MainRemoteDataSourceImpl|",
      );
      return Future.value(user);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `updateProfile` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<Unit> logOut() async {
    try {
      InjectionContainer.getIt<Logger>().i(
        "Start `logOut` in |MainRemoteDataSourceImpl|",
      );

      await apiService.get(
        subUrl: AppEndpoints.logout,
      );

      InjectionContainer.getIt<Logger>().w(
        "End `logOut` in |MainRemoteDataSourceImpl|",
      );
      return Future.value(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `logOut` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
