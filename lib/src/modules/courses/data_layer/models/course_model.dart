import 'package:equatable/equatable.dart';
import 'package:learning/src/modules/courses/data_layer/models/video_model.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';

class CourseModel extends Course {
  CourseModel(
      {required String name,
      required double rate,
      required String instructor,
      String? image,
      required List<Video> videos})
      : super(
            videos: videos,
            name: name,
            instructor: instructor,
            rate: rate,
            image: image);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "rete": rate,
      "instructor": instructor,
      "image": image,
      "videos": videos
    };
  }

  factory CourseModel.fromJson(Map<String, dynamic> json) {
 List <Video> videos = [];
    List  maps = json['videos'] != null ? json['videos'] as List : [];
 maps.forEach((element) {
   videos.add(VideoModel.fromJson(element));
 });
    return CourseModel(
      name: json["name"]?? "no name ",
      rate: json["rate"] != null ?  json["rate"].toDouble(): 0.0,
      instructor: json["instructor"].toString(),
      image: json['image'],
      videos: videos
    );
  }

  @override
  List<Object?> get props => [
        name,
        image,
        instructor,
        videos,
        rate,
      ];
}

/// on going
