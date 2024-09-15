import 'package:real_state/features/auth/data/models/authenticated_user_model.dart';
import 'package:real_state/features/auth/domain/entities/user_entity.dart';

class AuthenticatedUser {
  final User? user;
  final String? accessToken;

  const AuthenticatedUser({
    required this.user,
    required this.accessToken,
  });

  AuthenticatedUserModel toModel() {
    return AuthenticatedUserModel(
      user: user,
      accessToken: accessToken,
    );
  }
}
