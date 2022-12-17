import 'package:learning/src/modules/courses/domain_layer/entities/ongoing.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_data.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';

class OnGoingCourseModel extends OnGoingCourse {
  OnGoingCourseModel({required OnGoingData onGoingData, required String name, required List<Video> videos, required double rate, required String instructor, required double rating}) : super(onGoingData: onGoingData, name: name, videos: videos, rate: rate, instructor: instructor, rating: rating);

}