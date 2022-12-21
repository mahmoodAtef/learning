import 'package:equatable/equatable.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';

class OnGoingData extends Equatable {
  final String? courseId;
  final int? completed;
  final double? userRate;

  const OnGoingData(
      {required this.courseId,
      required this.completed,
      required this.userRate});

  @override
  List<Object?> get props => [completed, userRate];
}
