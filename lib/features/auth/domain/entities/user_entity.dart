import 'package:real_state/core/enums/user_role.dart';
import 'package:real_state/features/auth/data/models/user_model.dart';

class User {
  final int? id;
  final String name;
  final String number;
  final String photo;
  final String? whatsNumber;
  final String? password;
  final String? location;
  final String? qrCode;
  final UserRole role;

  const User({
    this.id,
    required this.name,
    required this.number,
    required this.photo,
    this.whatsNumber,
    this.password,
    this.location,
    this.qrCode,
    required this.role,
  });

  UserModel toModel() {
    return UserModel(
      id: id,
      name: name,
      number: number,
      photo: photo,
      whatsNumber: whatsNumber,
      location: location,
      qrCode: qrCode,
      role: role,
    );
  }
}
