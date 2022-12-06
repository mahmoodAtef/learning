
import 'package:equatable/equatable.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';

class Course extends Equatable {
  String name  ;
  String ? image ;
  List <Video> ? videos = [];
  double completed ;
  double  rating ;
  Course({required this.name, this.image, this.videos, required this.completed , required this.rating});

  @override

  List<Object?> get props => throw UnimplementedError();
}