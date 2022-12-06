import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning/src/core/utils/color_manager.dart';

abstract class BaseAuthRemoteDataSource {
  Future<Either<FirebaseAuthException, UserCredential?>> loginWithEmailAndPass({
    required String email,
    required String password,
  });
  Future<Either<FirebaseAuthException, UserCredential?>>
      registerWithEmailAndPass(
          {required String email,
          required String password,
          required String name});
  Future createUser({required String name, required String uid});
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  @override
  Future<Either<FirebaseAuthException, UserCredential?>> loginWithEmailAndPass(
      {required String email, required String password}) async {
    UserCredential? response = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Fluttertoast.showToast(
          msg: 'Login Successfully',
          textColor: ColorManager.white,
          backgroundColor: Colors.black);
      // print('done');
    });
    try {
      return Right(response);
    } on FirebaseAuthException catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<FirebaseAuthException, UserCredential?>>
      registerWithEmailAndPass({
    required String email,
    required String password,
    required String name,
  }) async {
    UserCredential? response = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) async {
      Fluttertoast.showToast(
          msg: 'Account created Successfully',
          textColor: ColorManager.white,
          backgroundColor: Colors.black);
      // print('done');
      await createUser(name: name, uid: value.user!.uid);
    });
    try {
      return Right(response);
    } on FirebaseAuthException catch (error) {
      return Left(error);
    }
  }

  @override
  Future createUser({required String name, required String uid}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({"name": name}).then((value) {
      // print ('done .. ');
    });
    throw Exception();
  }
}
