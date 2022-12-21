import 'package:equatable/equatable.dart';
import 'package:learning/src/modules/courses/data_layer/models/video_model.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class CourseModel extends Course {
  CourseModel(
      {required String name,
      required double rate,
      required String instructor,
      String? image,
      double? oldPrice,
      double? newPrice,
      required String description,
      required int subscribers,
      required List<AppVideo> videos})
      : super(
            name: name,
            videos: videos,
            rate: rate,
            instructor: instructor,
            image: image,
            subscribers: subscribers,
            description: description,
            oldPrice: oldPrice,
            newPrice: newPrice);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "rete": rate,
      "instructor": instructor,
      "image": image,
      "videos": videos,
    };
  }

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    List<AppVideo> videos = [];
    List<Video> videodata;
    List maps = json['videos'] != null ? json['videos'] as List : [];

    maps.forEach((element) {
      videos.add(VideoModel.fromJson(element));
    });
    return CourseModel(
      name: json["name"] ?? "no name ",
      rate: json["rate"] != null ? json["rate"].toDouble() : 0.0,
      instructor: json["instructor"].toString(),
      image: json['image'],
      videos: videos,
      subscribers: json["subs"] ?? 0,
      description: json['description'] ?? '',
      newPrice: json['new_price'] != null ? json['new_price'].toDouble() : 0.00,
      oldPrice: json['old_price'] != null ? json['old_price'].toDouble() : 0.00,
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
