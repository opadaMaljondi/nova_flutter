import 'package:real_state/features/auth/domain/entities/authenticated_user_entity.dart';

class AuthenticatedUserModel extends AuthenticatedUser {
  const AuthenticatedUserModel({
    required super.user,
    required super.accessToken,
  });

  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) {
    return AuthenticatedUserModel(
      user: json['user'],
      accessToken: json['accessToken'],
    );
  }
}
