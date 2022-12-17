import 'package:dartz/dartz.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:learning/src/modules/courses/data_layer/models/user_model.dart';
import 'package:learning/src/modules/courses/domain_layer/repsitories/base_courses_repository.dart';

import '../entities/user.dart';

class GetUserUseCase {
  BaseCoursesRepository baseCoursesRepository ;
  GetUserUseCase(this.baseCoursesRepository);

  Future<Either<FirebaseException, UserModel?>> exute({required String uid }) async
  {

    dynamic response =await baseCoursesRepository.getUser(uid: uid);
    print('use case : $response');
   return await response;

  }
}