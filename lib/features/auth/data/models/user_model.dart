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
      whatsNumber: json['whatsNumber'],
      location: json['location'],
      qrCode: json['qr_code'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'photo': photo,
      'whatsNumber': whatsNumber,
      'password': password,
      'location': location,
      'role': role,
      'qr_code': qrCode,
    };
  }
}
