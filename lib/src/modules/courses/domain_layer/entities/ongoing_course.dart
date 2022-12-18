import 'package:learning/src/modules/courses/domain_layer/entities/course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';

import 'ongoing_data.dart';

class OnGoingCourse extends Course {

 final double ? userRate ;
 final int completed ;

  OnGoingCourse({required String
  name, required
  List<Video> videos,
    required double rate,
    required String instructor,  this.userRate,
    required this.completed ,String ? image}) : super(name: name, videos: videos, rate: rate,
      instructor: instructor, image: image);


}