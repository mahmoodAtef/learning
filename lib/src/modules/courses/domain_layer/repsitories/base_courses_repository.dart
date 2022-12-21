import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning/src/modules/courses/data_layer/models/user_model.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_data.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../entities/course.dart';
import '../entities/instructor.dart';
import '../entities/user.dart';
import '../entities/video.dart';

abstract class BaseCoursesRepository {
  Future<Either<FirebaseException, UserModel?>> getUser({required String uid});
  Future<Either<FirebaseException, List<OnGoingCourse>>> getOnGoingCourses(
      {required List<OnGoingData> onGoingData});
  Future<Either<FirebaseException, List<Course>>> getMostPopularCourses();
  Future<Either<YoutubeExplodeException, List<AppVideo>>> getVideosData(
      {required List<AppVideo> videos});
  Future<Either<FirebaseException, Instructor>> getInstructor(
      {required String id});
}
