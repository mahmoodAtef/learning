import 'package:equatable/equatable.dart';

class Video extends Equatable{
  String ? title ;
  String url ;
  String Image ;
  String time;

  Video( {this.title, required this.url, required this.Image , required this.time});

  @override
  // TODO: implement props
  List<Object?> get props =>[];
}