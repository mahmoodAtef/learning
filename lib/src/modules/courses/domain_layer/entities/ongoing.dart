import 'package:learning/src/modules/courses/domain_layer/entities/course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';

import 'ongoing_data.dart';

class OnGoingCourse extends Course{
 OnGoingData onGoingData;
  OnGoingCourse ({
    required this.onGoingData,
    required String name,
    required List<Video> videos,
    required double rate, required String instructor, required double rating})
      : super(name: name, videos: videos, rate: rate,
      instructor: instructor, rating: rating);

}