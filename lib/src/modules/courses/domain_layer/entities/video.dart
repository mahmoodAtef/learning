import 'package:equatable/equatable.dart';

class Video extends Equatable{
 final String ? title ;
 final String url ;
final  String image ;
 final String time;

 const Video( {this.title, required this.url, required this.image , required this.time});

  @override
  List<Object?> get props =>[title , url , image , time];
}