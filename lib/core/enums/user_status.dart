import 'package:real_state/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum UserStatus {
  active('active', AppColors.success),
  pending('pending', AppColors.danger),
  inActive('inactive', AppColors.danger),
  incomplete('incomplete', AppColors.black20);

  const UserStatus(this.value, this.color);

  final String value;
  final Color color;

  String toJson() {
    return value;
  }

  static UserStatus fromJson(String value) {
    if (value == 'ACTIVE') {
      return active;
    }
    if (value == 'PENDING') {
      return pending;
    }
    if (value == 'INACTIVE') {
      return inActive;
    }
    return incomplete;
  }
}
