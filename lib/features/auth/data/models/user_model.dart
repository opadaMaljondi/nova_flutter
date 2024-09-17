import 'package:real_state/core/enums/user_role.dart';
import 'package:real_state/features/auth/domain/entities/user_entity.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.number,
    required super.photo,
    required super.whatsNumber,
    required super.location,
    required super.qrCode,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      photo: json['photo'],
      whatsNumber: json['whats_number'],
      location: json['location'],
      qrCode: json['qr_code'],
      role: UserRole.fromJson(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
      'whats_number': whatsNumber,
      'password': password,
      'location': location,
      'type': role.toJson(),
      'qr_code': qrCode,
    };
  }
}
