import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/instructor.dart';
import 'package:learning/src/modules/courses/domain_layer/repsitories/base_courses_repository.dart';

class GetInstructorUseCase {
  BaseCoursesRepository baseCoursesRepository;
  GetInstructorUseCase(this.baseCoursesRepository);
  Future<Either<FirebaseException, Instructor>> call(
      {required String id}) async {
    return baseCoursesRepository.getInstructor(id: id);
  }
}
