part of 'courses_bloc.dart';

abstract class CoursesEvent extends Equatable {
  const CoursesEvent();
}

class GetUserEvent extends CoursesEvent {
  String uid;
  GetUserEvent({required this.uid});
  @override
  List<Object?> get props => [];
}

class GetOngoingCoursesEvent extends CoursesEvent {
  List<OnGoingData> ongoingData;
  GetOngoingCoursesEvent({required this.ongoingData});
  @override
  List<Object?> get props => [ongoingData];
}

class GetMostPopularCoursesEvent extends CoursesEvent {
  @override
  List<Object?> get props => [];
}

class ViewMostPopularCoursesEvent extends CoursesEvent {
  @override
  List<Object?> get props => [];
}

class OpenNotificationsEvent extends CoursesEvent {
  @override
  List<Object?> get props => [];
}

class OpenCourseEvent extends CoursesEvent {
  @override
  List<Object?> get props => [];
}

class ChangeBottomNavEvent extends CoursesEvent {
  final int index;

  ChangeBottomNavEvent({required this.index});

  @override
  List<Object?> get props => [index];
}

class ChangeCourseTabEvent extends CoursesEvent {
  int index;
  ChangeCourseTabEvent(this.index);
  @override
  List<Object?> get props => [index];
}

/// get videos data

class GetVideosDataEvent extends CoursesEvent {
  List<AppVideo> videos;
  GetVideosDataEvent(this.videos);
  @override
  List<Object?> get props => [videos];
}

class GetInstructorEvent extends CoursesEvent {
  String id;
  GetInstructorEvent(this.id);
  @override
  List<Object?> get props => [id];
}
