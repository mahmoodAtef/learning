import 'package:learning/src/modules/courses/data_layer/models/video_model.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_data.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';

class OnGoingCourseModel extends OnGoingCourse {
  OnGoingCourseModel({
    required String name,
    required List<AppVideo> videos,
    required double rate,
    required String instructor,
    required double userRate,
    required int completed,
    String? image,
    double? oldPrice,
    double? newPrice,
    required String description,
    required int subscribers,
  }) : super(
          name: name,
          videos: videos,
          rate: rate,
          instructor: instructor,
          completed: completed,
          image: image,
          userRate: userRate,
          description: description,
          subscribers: subscribers,
        );

  static OnGoingCourse fromJson(
      {required OnGoingData onGoingData, required Map<String, dynamic> json}) {
    print("Id : ${onGoingData.courseId}");
    List? maps = json['videos']! as List;
    List<AppVideo> videos = [];
    maps.forEach((element) {
      videos.add(VideoModel.fromJson(element));
    });

    return OnGoingCourse(
      description: json['description'],
      subscribers: json['subs'] ?? 0,
      completed: onGoingData.completed!,
      userRate: onGoingData.userRate!,
      name: json['name'],
      videos: videos,
      rate: json['rate'].toDouble(),
      instructor: json['instructor'],
      image: json['image'],
    );
  }
}
