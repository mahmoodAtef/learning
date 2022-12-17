import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/modules/courses/domain_layer/use_cases/get_user_usecase.dart';
import '../../../../core/services/dep_injection.dart';
import '../../../user/presentation_layer/screens/cart.dart';
import '../../domain_layer/entities/user.dart';
import '../screens/home.dart';
import '../screens/my_courses.dart';
part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
   int currentIndex = 2;
   Widget currentPage = const Home ();
  static CoursesBloc get (BuildContext context) => BlocProvider.of<CoursesBloc>(context);
  List <Widget> pages =
  [
    const MyCourses(),
//    const AllExams (),
    const Home(),
    const Cart ()  ,
  //  const HonorRoll (),
  ];
 
  CoursesBloc(CoursesInitial coursesInitial) : super(CoursesInitial())
  {
    /// add(GetUserEvent(uid: 'atjZPpyM10e7a1U0jU8NW7wPA2j1'));
    on<CoursesEvent>((event, emit) async {
      if (event is GetUserEvent)  {
           print('get....');
       final  response = await GetUserUseCase(sl()).exute(uid: event.uid);
       response.fold((l) => {}, (r)
       {
         print ('r: $response');
         emit(GetUserSuccessfulState(user: r!));
         add(GetOngoingCoursesEvent());
       });
      }
      if (event is GetOngoingCoursesEvent){}
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
