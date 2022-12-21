import 'package:flutter/material.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/video.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideoScreen extends StatelessWidget {
  AppVideo video;

  PlayVideoScreen({Key? key, required this.video}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController youtubePlayerController =
        YoutubePlayerController(initialVideoId: video.id);
    YoutubeExplode().videos.get(video.id);
    return YoutubePlayer
      (
      controller: youtubePlayerController,
    );
  }
}
