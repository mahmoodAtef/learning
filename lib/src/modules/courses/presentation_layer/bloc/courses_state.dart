part of 'courses_bloc.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();
}

class GetUserLoadingState extends CoursesState {
  const GetUserLoadingState();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetUserSuccessfulState extends CoursesState {
  AppUser user;
  GetUserSuccessfulState({required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetUserErrorState extends CoursesState {
  const GetUserErrorState();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CoursesInitial extends CoursesState {
  @override
  List<Object> get props => [];
}

class ChangeBottomNavState extends CoursesState {
  int index;

  ChangeBottomNavState({required this.index});

  @override
  List<Object?> get props => [index];
}

/// ongoing
class GetOnGoingLoadingState extends CoursesState {
  const GetOnGoingLoadingState();
  @override
  List<Object?> get props => [];
}

class GetOnGoingSuccessFulState extends CoursesState {
  List<OnGoingCourse> courses;
  GetOnGoingSuccessFulState(this.courses);
  @override
  List<Object?> get props => [courses];
}

class GetOnGoingErrorState extends CoursesState {
  FirebaseException error;
  GetOnGoingErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

/// most popular

class GetMostPopularLoadingState extends CoursesState {
  const GetMostPopularLoadingState();
  @override
  List<Object?> get props => [];
}

class GetMostPopularSuccessFulState extends CoursesState {
  List<Course> courses;
  GetMostPopularSuccessFulState(this.courses);
  @override
  List<Object?> get props => [];
}

class GetMostPopularErrorState extends CoursesState {
  FirebaseException error;
  GetMostPopularErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class ChangeCourseTabState extends CoursesState {
  int index;
  ChangeCourseTabState(this.index);
  @override
  List<Object?> get props => [index];
}

/// get videos data
class GetVideosDataLoadingState extends CoursesState {
  const GetVideosDataLoadingState();
  @override
  List<Object?> get props => [];
}

class GetVideosDataSuccessFulState extends CoursesState {
  List<AppVideo> videos;
  GetVideosDataSuccessFulState(this.videos);
  @override
  List<Object?> get props => [videos];
}

class GetVideosDataErrorState extends CoursesState {
  YoutubeExplodeException error;
  GetVideosDataErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class GetInstructorLoadingState extends CoursesState {
  const GetInstructorLoadingState();
  @override
  List<Object?> get props => [];
}

class GetInstructorSuccessFulState extends CoursesState {
  Instructor instructor;
  GetInstructorSuccessFulState(this.instructor);
  @override
  List<Object?> get props => [instructor];
}

class GetInstructorErrorState extends CoursesState {
  FirebaseException error;
  GetInstructorErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
