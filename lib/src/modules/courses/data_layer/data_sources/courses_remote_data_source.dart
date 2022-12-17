import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning/src/modules/courses/data_layer/models/course_model.dart';
import 'package:learning/src/modules/courses/data_layer/models/ongoing_data_model.dart';
import 'package:learning/src/modules/courses/data_layer/models/user_model.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_data.dart';

import '../../domain_layer/entities/user.dart';

abstract class BaseCoursesRemoteDataSource
{
  Future<Either<FirebaseException, UserModel?>>  getUser({required String uid});
  Future <Either<FirebaseException, List<OnGoingData>?>> getOngoingData ({required String uid }) ;
}
class CoursesRemoteDataSource extends BaseCoursesRemoteDataSource
{
  @override
  Future<Either<FirebaseException, List<OnGoingData>?>> getOngoingData({required String uid}) {
 FirebaseFirestore.instance.doc("users/${uid}").get().then((value) {

 });

    throw UnimplementedError ();
  }

  @override
  Future<Either<FirebaseException, UserModel>>  getUser ({required String uid}) async
  {
late UserModel user1 ;

 try {
   final response = await FirebaseFirestore.instance.doc('users/${uid}').get().then((value) {
     UserModel  user = UserModel.fromJson(value.data()!);
    user1 = user;
   });
//response.fold((l) => l, (r) => r);
   return Right(user1);
 }
 
   on FirebaseException  catch (error){
   return Left(error);
     }
 // return left(FirebaseException(plugin: 'error'));
  }


}