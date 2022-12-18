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
  // TODO: implement props
  List<Object?> get props => [];
}

class GetOnGoingSuccessFulState extends CoursesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
