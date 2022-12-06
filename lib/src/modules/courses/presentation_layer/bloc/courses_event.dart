part of 'courses_bloc.dart';

abstract class CoursesEvent extends Equatable {
  const CoursesEvent();
}
class ShowDrawerEvent extends CoursesEvent{
  const ShowDrawerEvent();

  @override
  List<Object?> get props => [];
}

class GetOngoingCoursesEvent extends CoursesEvent{
  @override

  List<Object?> get props => [];
}

class GetMostPopularCoursesEvent extends CoursesEvent{
  @override

  List<Object?> get props => [];
}

class ViewMostPopularCoursesEvent extends CoursesEvent{
  @override

  List<Object?> get props => [];
}

class OpenNotificationsEvent extends CoursesEvent{
  @override

  List<Object?> get props => [];
}

class OpenCourseEvent extends CoursesEvent
{
  @override

  List<Object?> get props => [];

}

class ChangeBottomNavEvent extends CoursesEvent
{
  final int index  ;

  ChangeBottomNavEvent({ required this.index });

  @override

  List<Object?> get props => [index];
}