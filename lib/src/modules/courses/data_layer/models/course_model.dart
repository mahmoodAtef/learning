
import 'package:equatable/equatable.dart';
import 'package:learning/src/modules/courses/data_layer/models/video_model.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';

class CourseModel extends Course {

  CourseModel({
    required String name,
    required double rate,
    required String instructor , String? image , required List
  <Video>videos }) : super(videos: videos , name: name , rating:  rate , instructor:  instructor, rate: rate , image: image)  ;

     Map<String, dynamic> toJson ()  {
       return {
         "name" : name ,
         "rete" : rate ,
         "instructor": instructor ,
         "image" : image ,
         "videos" : videos
       };
     }
 factory CourseModel.fromJson (Map <String , dynamic > json)
  {
       return CourseModel (name: json["name"], rate:
       json["rate"], instructor: json
       ["instructor"].toString()  , image : json ['image'] ,
         videos: List.of(json['videos'].docs().map((e) => VideoModel.fromJson(e.data()))),
       ) ;
  }

  @override
  List<Object?> get props => [name , image , instructor , videos ,  rate ,];


}
/// on going 