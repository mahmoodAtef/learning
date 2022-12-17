import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning/src/modules/courses/data_layer/models/user_model.dart';

import '../entities/user.dart';

abstract class BaseCoursesRepository {

  Future<Either<FirebaseException, UserModel?>> getUser ({required String uid });
}