import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_data.dart';
import 'package:learning/src/modules/courses/domain_layer/repsitories/base_courses_repository.dart';

class GetOngoingCoursesUseCase {
  BaseCoursesRepository baseCoursesRepository ;
  GetOngoingCoursesUseCase(this.baseCoursesRepository);
  call(List<OnGoingData> onGoingData)
  async {
    dynamic response =await baseCoursesRepository.getOnGoingCourses(onGoingData: onGoingData);
  
   return await response;
  }
}