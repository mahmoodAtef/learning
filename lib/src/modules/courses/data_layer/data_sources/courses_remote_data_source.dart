import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning/src/modules/courses/data_layer/models/course_model.dart';
import 'package:learning/src/modules/courses/data_layer/models/ongoing_course_model.dart';
import 'package:learning/src/modules/courses/data_layer/models/ongoing_data_model.dart';
import 'package:learning/src/modules/courses/data_layer/models/user_model.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_data.dart';

import '../../domain_layer/entities/ongoing_course.dart';
import '../../domain_layer/entities/user.dart';

abstract class BaseCoursesRemoteDataSource {
  Future<Either<FirebaseException, UserModel?>> getUser({required String uid});
  Future<Either<FirebaseException, List<OnGoingCourse>>> getOngoingCourses(
      {required List<OnGoingData> onGoingData});
  Future<Either<FirebaseException, List<Course>>> getMostPopularCourses();
}

class CoursesRemoteDataSource extends BaseCoursesRemoteDataSource {
  @override
  Future<Either<FirebaseException, UserModel>> getUser(
      {required String uid}) async {
    late UserModel user1;
    try {
      await FirebaseFirestore.instance.doc('users/${uid}').get().then((value) {
        UserModel user = UserModel.fromJson(value.data()!);
        user1 = user;
      });
      return Right(user1);
    } on FirebaseException catch (error) {
      return Left(error);
    }
    // return left(FirebaseException(plugin: 'error'));
  }

  @override
  Future<Either<FirebaseException, List<OnGoingCourse>>> getOngoingCourses(
      {required List<OnGoingData> onGoingData}) async {
    late List<OnGoingCourse> courses = [];
    try {
      for (var element in onGoingData) {
        await FirebaseFirestore.instance
            .doc('courses/${element.courseId}')
            .get()
            .then((value) {
          print("value :" + value.data()!.toString());
          courses.add(OnGoingCourseModel.fromJson(
              onGoingData: element, json: value.data()!));
          print("c:cc" + courses.toString());
        });
      }

      print("Ongoing Courses : $courses");
      return Right(await courses);
    } on FirebaseException catch (error) {
      return Left(error);
    }

    //  throw UnimplementedError();
  }

  Future<List<OnGoingCourse>> _getOngoingCourse(
      {required List<OnGoingData> onGoingData}) async {
    late List<OnGoingCourse> courses = [];
    onGoingData.forEach((element) async {
      FirebaseFirestore.instance
          .doc('courses/${element.courseId}')
          .get()
          .then((value) {
        courses.add(OnGoingCourseModel.fromJson(
            onGoingData: element, json: value.data()!));
      });
    });

    print("Ongoing Courses : $courses");
    return courses;
  }

  @override
  Future<Either<FirebaseException, List<Course>>>
      getMostPopularCourses() async {
    try {
      List<Course> courses = [];
      await FirebaseFirestore.instance
          .collection('courses')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          courses.add(CourseModel.fromJson(element.data()));
        });
      });
      return Right(courses);
    } on FirebaseException catch (error) {
      return Left(error);
    }
  }
}
