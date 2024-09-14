import 'package:real_state/features/news/domain/entities/departments_entity.dart';

class News {
  final int id;
  final String title;
  final String body;
  final String image;
  final Departments departments;

  const News({
    required this.id,
    required this.title,
    required this.body,
    required this.image,
    required this.departments,
  });
}
