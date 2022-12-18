import 'package:equatable/equatable.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';

class Course extends Equatable {
  final String name;
  final String? image;
  final String instructor;
  final List<Video> videos;
  final double rate;
  const Course({
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
