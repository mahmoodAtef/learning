import 'package:equatable/equatable.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';

class Course extends Equatable {
  final String name;
  final String? image;
  final String instructor;
  List<AppVideo> videos;
  final double? oldPrice;
  final double? newPrice;
  final String description;
  final int subscribers;
  final double rate;
  Course({
    required this.description,
    required this.subscribers,
    required this.oldPrice,
    this.newPrice,
    required this.name,
    this.image,
    required this.videos,
    required this.rate,
    required this.instructor,
  });
  @override
  List<Object?> get props => [
        name,
        image,
        instructor,
        videos,
        rate,
      ];
}
