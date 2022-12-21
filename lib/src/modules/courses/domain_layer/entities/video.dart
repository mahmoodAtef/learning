import 'package:equatable/equatable.dart';

class AppVideo extends Equatable {
  final String title;
  final String url;
  final String time;
  final String id;

  AppVideo(
      {required this.title,
      required this.url,
      required this.time,
      required this.id});

  @override
  List<Object?> get props => [title, url, time];
}
