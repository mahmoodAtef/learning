import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/modules/courses/presentation_layer/screens/play_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:learning/src/core/utils/navigation_manager.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_course.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_data.dart';
import 'package:learning/src/modules/courses/presentation_layer/screens/course_details.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../domain_layer/entities/course.dart';
import '../../domain_layer/entities/video.dart';
import '../bloc/courses_bloc.dart';

Widget courseBuilder({
  required Course course,
  context,
}) {
  return InkWell(
      onTap: () {
        NavigationManager.push(context, CourseDetails(course: course));
      },
      child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: MediaQuery.of(context).size.width * .6,
          height: MediaQuery.of(context).size.width * .7,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(55), topRight: Radius.circular(55))),
          child: Card(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * .5,
                  decoration: BoxDecoration(
                      color: ColorManager.grey2,
                      image: DecorationImage(
                          image: NetworkImage(
                            '${course.image}',
                          ),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.zero,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.name,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeightManager.bold,
                            fontSize: FontSizeManager.s18,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            //   const Text ('rate :', style:  const TextStyle (fontWeight:  FontWeightManager.medium, fontSize: FontSizeManager.s18),),
                            RatingStars(
                              value: course.rate,
                              starBuilder: (index, color) => Icon(
                                Icons.star,
                                color: color,
                              ),
                              starCount: 5,
                              starSize: 20,
                              valueLabelColor: ColorManager.white,
                              valueLabelTextStyle: TextStyle(
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.w900,
                                  //     fontStyle: FontStyle.normal,
                                  fontSize: 15.0),
                              //valueLabelRadius: 10,
                              maxValue: 5,
                              valueLabelPadding: const EdgeInsets.only(left: 5),
                              starSpacing: 2,
                              maxValueVisibility: false,
                              valueLabelVisibility: true,
                              starOffColor: const Color(0xffe7e8ea),
                              starColor: ColorManager.yellow,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
            elevation: 3,
            clipBehavior: Clip.antiAliasWithSaveLayer,
          )));
}

Widget onGoingBuilder(int index, OnGoingCourse course) {
  return index % 2 == 0
      ? Container (
          width: 330,
          padding: const EdgeInsets.all(PaddingManager.p10),
          decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(SizeManager.s50),
          ),
          height: 200,
// width: 400,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(
                              SizeManager.s8,
                            ),
                            image: DecorationImage(
                                image: NetworkImage("${course.image}"))),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              '${course.name}',
                              style: TextStyle(
                                  color: ColorManager.white,
                                  fontWeight: FontWeightManager.bold,
                                  fontSize: FontSizeManager.s18),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Text(
                              'By : ${course.instructor}',
                              style: TextStyle(
                                  color: ColorManager.white,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: FontSizeManager.s14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Slider(
                  value: course.completed.toDouble(), // Todo: Complete this
                  onChanged: (value) {}, activeColor: ColorManager.yellow,
                  max: 100, min: 0, thumbColor: ColorManager.yellow,
                ),
              ),
              Text(
                "Competed ${course.completed} %",
                style: TextStyle(color: ColorManager.white),
              )
            ],
          ),
        )
      : Container (
          padding: const EdgeInsets.all(PaddingManager.p10),
          decoration: BoxDecoration(
            color: ColorManager.yellow,
            borderRadius: BorderRadius.circular(SizeManager.s50),
          ),
          height: SizeManager.s200,
          width: 330,
// width: 400,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(
                              SizeManager.s8,
                            ),
                            image: DecorationImage(
                                image: NetworkImage("${course.image}"))),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(
                              '${course.name}',
                              style: TextStyle(
                                  color: ColorManager.white,
                                  fontWeight: FontWeightManager.bold,
                                  fontSize: FontSizeManager.s18),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                            Text(
                              'By : ${course.instructor}',
                              style: TextStyle(
                                  color: ColorManager.white,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: FontSizeManager.s14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Slider(
                  value: course.completed.toDouble(),
                  onChanged: (value) {},
                  activeColor: ColorManager.primary,
                  max: 100,
                  min: 0,
                  thumbColor: ColorManager.primary,
                ),
              ),
              Text(
                "Competed ${course.completed} %",
                style: TextStyle(color: ColorManager.white),
              )
            ],
          ),
        );
}

AppBar defaultAppBar({
  required String title,
  Widget? leading,
  List<IconData>? actions,
}) {
  return AppBar(
    backgroundColor: ColorManager.white,
    centerTitle: true,
    title: Text(
      title,
    ),
    leading: leading,
    actions: actions != null
        ? actions
            .map((e) => Padding(
                  padding: const EdgeInsets.all(PaddingManager.p8),
                  child: Padding(
                    padding: const EdgeInsets.all(PaddingManager.p8),
                    child: Icon(
                      e,
                    ),
                  ),
                ))
            .toList()
        : null,
    shape: const StadiumBorder(),
  );
}

Widget videoBuilder(AppVideo video, BuildContext context) {
  YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: video.id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ));
  return Card (
        child: InkWell(
          onTap: () {
            NavigationManager.push(context, PlayVideoScreen(video: video));
          },
          child: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular (SizeManager.s15),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: double.infinity,
              height: QueryValues.height(context) / 10,
              padding: const EdgeInsets.all(PaddingManager.p10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10),
                    child: Stack(
                      children: [
                        Container(
                          height: QueryValues.width(context) / 5,
                          width: QueryValues.width(context) / 5,
                          child: YoutubePlayer(
                              controller: controller,
                              width: QueryValues.width(context) / 5),
                        ),
                        Container(
                          height: QueryValues.width(context) / 5,
                          width: QueryValues.width(context) / 5,
                          decoration: BoxDecoration(
                            color: ColorManager.black.withOpacity(.4),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(SizeManager.s10)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          video.title,
                          style: TextStyle(
                              fontSize: FontSizeManager.s16,
                              fontWeight: FontWeightManager.bold,
                              color: ColorManager.black,
                              height: .97),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        video.time.substring(0, 7),
                        style: TextStyle(
                            fontSize: FontSizeManager.s14,
                            fontWeight: FontWeightManager.bold,
                            color: ColorManager.grey2),
                      ),
                    ],
                  )),
                  const Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ),
      );


}

List<AppVideo> videosTest = [
  AppVideo(
      id: 'VruwCyoEMf0',
      url: 'https://www.youtube.com/watch?v=VruwCyoEMf0',
      time: '20:02',
      title:
          'Video 1 Title Video 1 Title Video 1 Title Video 1 Title Video 1 TitleVideo 1 Title Video 1 Title Video 1 Title Video 1 Title '),
  AppVideo(
    title: '',
    id: 'VruwCyoEMf0',
    url: '',
    time: '20:02',
  ),
  AppVideo(
      id: 'VruwCyoEMf0',
      url: 'https://www.youtube.com/watch?v=VruwCyoEMf0',
      time: '20:02',
      title:
          'Video 1 Title Video 1 Title Video 1 Title Video 1 Title Video 1 TitleVideo 1 Title Video 1 Title Video 1 Title Video 1 Title '),
  AppVideo(
      id: 'VruwCyoEMf0',
      url: 'https://www.youtube.com/watch?v=VruwCyoEMf0',
      time: '20:02',
      title:
          'Video 1 Title Video 1 Title Video 1 Title Video 1 Title Video 1 TitleVideo 1 Title Video 1 Title Video 1 Title Video 1 Title '),
  AppVideo(
      id: 'VruwCyoEMf0',
      url: 'https://www.youtube.com/watch?v=VruwCyoEMf0',
      time: '20:02',
      title:
          'Video 1 Title Video 1 Title Video 1 Title Video 1 Title Video 1 TitleVideo 1 Title Video 1 Title Video 1 Title Video 1 Title '),
];
//
// class CourseTest extends StatelessWidget {
//   const CourseTest({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: ColorManager.primary,
//       ),
//       body: Center(
//         child: courseBuilder(
//           course: const Course(
//
//             name: 'lol',
//             rate: 3.5,
//             instructor: "ahmed",
//             videos: [],
//           ),
//           context: context,
//         ),
//       ),
//     );
//   }
// }

// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "Course Name Course Name Course Name Course Name Course Name CourseTestCourseTest ",
// style: TextStyle(
// fontSize: FontSizeManager.s22,
// fontWeight: FontWeightManager.bold),
// maxLines: 2,
// overflow: TextOverflow.ellipsis),
// Container(decoration: BoxDecoration(image:
// DecorationImage(image: NetworkImage
// ('https://img.icons8.com/external-flaticons-'
// 'flat-flat-icons/344/external-course-university-flaticons-flat-flat-icons-2.png'))),
// height: MediaQuery.of(context).size.width*.6,
// ) ,
//
// ],
// ),
