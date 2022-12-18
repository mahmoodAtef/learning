import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning/src/modules/courses/data_layer/models/course_model.dart';
import 'package:learning/src/modules/courses/data_layer/models/video_model.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_data.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';

class OnGoingDataModel extends OnGoingData {
  OnGoingDataModel(
      {required String? courseId,
      required int? completed,
      required double? userRate})
      : super(courseId: courseId, completed: completed, userRate: userRate);
  Map<String, dynamic> toJson() {
    return {"cid": courseId, "completed": completed, "rate": userRate};
  }

  static OnGoingData fromJson(Map<String, dynamic> json) {
    return OnGoingData(
        courseId: json["cid"],
        completed: json["completed"],
        userRate: json["rate"].toDouble());
  }
}
