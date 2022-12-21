import 'package:dartz/dartz.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../entities/video.dart';
import '../repsitories/base_courses_repository.dart';

class GetVideosDataUseCase {
  BaseCoursesRepository baseCoursesRepository;
  GetVideosDataUseCase(this.baseCoursesRepository);
  Future<Either<YoutubeExplodeException, List<AppVideo>>> call(
      {required List<AppVideo> videos}) async {
    dynamic response =
        await baseCoursesRepository.getVideosData(videos: videos);
    return response;
  }
}
