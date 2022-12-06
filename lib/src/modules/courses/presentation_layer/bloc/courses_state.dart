part of 'courses_bloc.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();
}

class CoursesInitial extends CoursesState {
  @override
  List<Object> get props => [];
}
class ChangeBottomNavState extends CoursesState {
  int index ;

  ChangeBottomNavState({required this.index});

  @override
  List<Object?> get props => [index];
}
