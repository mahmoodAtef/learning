import 'package:learning/src/modules/courses/domain_layer/entities/user.dart';

class Instructor extends AppUser {
  List ? courseIds = [];
  String? image;
  String jobTitle;
  Instructor(
      {required String name,
      this.courseIds,
      this.image,
      required this.jobTitle})
      : super(
          name: name,
        );
  @override
  List<Object?> get props => [name, image, jobTitle, courseIds];
}
