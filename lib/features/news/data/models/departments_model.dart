import 'package:real_state/features/news/domain/entities/departments_entity.dart';

class DepartmentsModel extends Departments {
  DepartmentsModel({
    required super.title,
    required super.body,
    required super.video,
    required super.id,
    required super.newsId,
  });

  factory DepartmentsModel.fromJson(Map<String, dynamic> json) {
    return DepartmentsModel(
      title: json['title'],
      body: json['body'],
      video: json['video'],
      id: json['id'],
      newsId: json['news_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'video': video,
      'id': id,
      'newsId': newsId,
    };
  }
}
