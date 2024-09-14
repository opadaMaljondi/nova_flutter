import 'package:real_state/features/news/domain/entities/news_entity.dart';

class NewsModel extends News {
  const NewsModel({
    required super.id,
    required super.title,
    required super.body,
    required super.image,
    required super.departments,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['news']['id'],
      title: json['news']['title'],
      body: json['news']['body'],
      image: json['news']['image'],
      departments: json['news']['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "image ": image,
      "departments": departments,
    };
  }
}
