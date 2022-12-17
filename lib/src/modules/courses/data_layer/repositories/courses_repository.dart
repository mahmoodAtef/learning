import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning/src/modules/courses/data_layer/data_sources/courses_remote_data_source.dart';
import 'package:learning/src/modules/courses/data_layer/models/user_model.dart';
import 'package:learning/src/modules/courses/domain_layer/repsitories/base_courses_repository.dart';

import '../../domain_layer/entities/user.dart';

class CoursesRepository extends BaseCoursesRepository
{
 BaseCoursesRemoteDataSource baseCoursesRemoteDataSources;
 CoursesRepository(this.baseCoursesRemoteDataSources);
  @override
  Future<Either<FirebaseException, UserModel>>  getUser({required String uid }) async {

   dynamic response = await baseCoursesRemoteDataSources.getUser(uid: uid);
   print('CoursesRepository : $response');
 return response;

  }
}