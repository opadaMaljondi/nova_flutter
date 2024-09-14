import 'package:real_state/features/company/domain/entities/company_entity.dart';

class CompanyModel extends Company {
  const CompanyModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
    required super.location,
    required super.phoneNumber,
    required super.website,
    required super.email,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      location: json['location'],
      phoneNumber: json['phone_num'],
      website: json['website'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'location': location,
      'phone_num': phoneNumber,
      'website': website,
      'email': email,
    };
  }
}
