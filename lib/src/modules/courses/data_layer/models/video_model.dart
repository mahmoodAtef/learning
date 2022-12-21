import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoModel extends AppVideo {
  VideoModel({
    required String url,
    required String time,
    required String title,
    required String id,
  }) : super(url: url, time: time, id: id, title: title);
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    String id = YoutubePlayer.convertUrlToId(json['url']).toString();
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: id,
    );

    YoutubePlayerValue youtubePlayerValue = YoutubePlayerValue();
    YoutubeExplode().videos.get(id);
    return VideoModel(
      url: json['url'],
      time: controller.value.metaData.duration.toString(),
      title: controller.metadata.title,
      id: id,
    );
  }
  factory VideoModel.fromVideo(Video video) {
    return VideoModel(
        url: video.url,
        time: video.duration.toString(),
        title: video.title,
        id: video.id.toString());
  }
}
