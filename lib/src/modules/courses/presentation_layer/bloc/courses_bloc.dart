import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../exams/presentation_layer/screens/all_exams.dart';
import '../../../exams/presentation_layer/screens/honor_roll.dart';
import '../../../user/presentation_layer/screens/cart.dart';
import '../screens/home.dart';
import '../screens/my_courses.dart';

part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
   int currentIndex = 2;
   Widget currentPage = Home ();
  static CoursesBloc get (BuildContext context) => BlocProvider.of<CoursesBloc>(context);
  List <Widget> pages =
  [
    MyCourses(),
    AllExams (),
    Home(),
    Cart ()  ,
    HonorRoll (),
  ];
  CoursesBloc(CoursesInitial coursesInitial) : super(CoursesInitial())
  {

    on<CoursesEvent>((event, emit) {
      if (event is ShowDrawerEvent){}
      else if (event is GetOngoingCoursesEvent){}
      else if (event is GetMostPopularCoursesEvent){}
      else if (event is ViewMostPopularCoursesEvent){}
      else if (event is OpenNotificationsEvent){}
      else if (event is OpenCourseEvent){}
      else if (event is ChangeBottomNavEvent)
      {
        currentPage = pages [event.index];
      currentIndex =  event.index ;
emit (ChangeBottomNavState(index:  event.index));
      }
    });
  }

}
