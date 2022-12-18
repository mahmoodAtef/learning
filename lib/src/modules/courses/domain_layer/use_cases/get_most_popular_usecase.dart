import 'package:learning/src/modules/courses/domain_layer/repsitories/base_courses_repository.dart';

class GetMostPopularUseCase {
  BaseCoursesRepository baseCoursesRepository ;
  GetMostPopularUseCase(this.baseCoursesRepository);
  call(){
    return baseCoursesRepository.getMostPopularCourses();
  }
}
