import 'package:learning/src/modules/courses/domain_layer/entities/instructor.dart';

class InstructorModel extends Instructor {
  InstructorModel(
      {required String name,
      required String jobTitle,
      String? image,
      List ? courseIds})
      : super(
            name: name, jobTitle: jobTitle, image: image, courseIds: courseIds);
  factory InstructorModel.fromJson(Map<String, dynamic> json) {

    return InstructorModel(
        name: json['name'],
        jobTitle: json['job_title'],
        courseIds: json['courses'] as List ,
        image: json['image']);
  }
}
