import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/features/auth/data/models/user_model.dart';
import 'package:real_state/features/auth/domain/entities/user_entity.dart';
import 'package:real_state/features/main/domain/entities/notification_entity.dart';

abstract class MainRepo {
  Future<Either<Failure, List<Notification>>> getNotifications();
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, Unit>> logOut();
  Future<Either<Failure, User>> updateProfile({
    required UserModel userModel,
    required File? photo,
  });
}
