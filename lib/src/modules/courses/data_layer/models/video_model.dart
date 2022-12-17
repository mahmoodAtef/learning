import '../../domain_layer/entities/video.dart';

class VideoModel extends Video {
  VideoModel({required String url, required String image, required String time}) : super(url: url, image: image, time: time);
  factory VideoModel.fromJson(Map<String , dynamic>json) {
    return VideoModel(url: json['url'], image: json["image"], time: json["time"]);
  }
}