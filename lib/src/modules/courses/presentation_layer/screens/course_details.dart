import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:learning/src/core/utils/navigation_manager.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/instructor.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_course.dart';
import 'package:learning/src/modules/courses/presentation_layer/bloc/courses_bloc.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../domain_layer/entities/course.dart';
import '../components/courses_components.dart';

class CourseDetails extends StatelessWidget {
  Course course;
  // bool isOwned = true;

  CourseDetails({Key? key, required this.course}) : super(key: key);

  int current = 0;

  @override
  Widget build(BuildContext context) {
    double height = QueryValues.height(context);
    double width = QueryValues.width(context);

    return BlocProvider(
      create: (context) => CoursesBloc(CoursesInitial())
        ..add(GetVideosDataEvent(course.videos))
        ..add(GetInstructorEvent(course.instructor)),
      child: BlocConsumer<CoursesBloc, CoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (CoursesBloc.get(context).videosData != []) {
            course.videos = CoursesBloc.get(context).videosData;
          }
          Instructor instructor = CoursesBloc.get(context).instructor ;


          List<Widget> tabs = [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                course.videos.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            videoBuilder(course.videos[index], context),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20,
                            ),
                        itemCount: course.videos.length)
                    : const Center(
                        child: Text('No videos yet'),
                      ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorManager.grey2,
                        backgroundImage: NetworkImage(
                            instructor.image ?? 'https://th.bing.com/th/id/R.aece1145f2d3480e38bc9443a4998c04?rik=OPAj8Wn3J196hg&pid=ImgRaw&r=0'),
                      ),
                      SizedBox(
                        width: width * .020,
                      ),
                      Column(
                        children: [
                          Text(
                            '${instructor.name}',
                            style: TextStyle(
                              color: ColorManager.black,
                              fontWeight: FontWeightManager.bold,
                              fontSize: FontSizeManager.s18,
                            ),
                          ),
                          Text(
                            instructor.jobTitle,
                            style: TextStyle(
                                color: ColorManager.grey2,
                                fontWeight: FontWeightManager.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .010,
                  ),
                  Container(
                    child: TextField(
                      enabled: false,
                      controller:
                          TextEditingController(text: '${course.description}'),
                      minLines: 1,
                      maxLines: 10,
                    ),
                  ),
                  SizedBox(
                    height: height * .010,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${course.subscribers ?? 0} Subscriber :',
                        style: TextStyle(
                          color: ColorManager.black,
                          fontWeight: FontWeightManager.bold,
                          fontSize: FontSizeManager.s18,
                        ),
                      ),
                      const Spacer(),
                      RatingStars(
                        starColor: ColorManager.yellow,
                        value: course.rate,
                        starCount: 5,
                        maxValue: 5,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ];
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: defaultAppBar(
                  title: 'Details',
                  leading: IconButton(
                      onPressed: () {
                        NavigationManager.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  actions: [Icons.bookmark]),
              body: Padding(
                padding: const EdgeInsets.all(PaddingManager.p20),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(SizeManager.s15),
                                  image: DecorationImage(
                                      image: NetworkImage(course.image!),
                                      fit: BoxFit.cover)),
                              height: height / 4.5,
                              width: QueryValues.width(context),
                            ),
                            SizedBox(
                              height: height * .025,
                            ),
                            Text(
                              course.name,
                              style: const TextStyle(
                                  fontSize: FontSizeManager.s22,
                                  fontWeight: FontWeightManager.maxWeight),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: height * .025,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: ColorManager.grey2,
                                ),
                                Text(
                                  ' 4 hours / 7 videos ',
                                  style: TextStyle(
                                      color: ColorManager.grey2,
                                      fontWeight: FontWeightManager.bold),
                                ),
                                const Spacer(),
                                Text(
                                  ' ${course.newPrice != 0 ? course.newPrice.toString() + ' \$' : 'Free \$'} ',
                                  style: TextStyle(
                                    color: ColorManager.black,
                                    fontWeight: FontWeightManager.bold,
                                    fontSize: FontSizeManager.s20,
                                  ),
                                ),
                                Text(
                                  ' ${course.oldPrice != 0 ? course.oldPrice.toString() + ' \$' : ''} ',
                                  style: TextStyle(
                                    color: ColorManager.grey2,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeightManager.bold,
                                    fontSize: FontSizeManager.s18,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * .025,
                            ),
                            Center(
                              child: TabBar(
                                onTap: (index) {
                                  CoursesBloc.get(context)
                                      .add(ChangeCourseTabEvent(index));
                                },
                                enableFeedback: true,
                                unselectedLabelColor: ColorManager.grey2,
                                indicatorColor: ColorManager.black,
                                isScrollable: true,
                                labelColor: ColorManager.primary,
                                labelStyle: TextStyle(
                                  color: ColorManager.black,
                                  fontWeight: FontWeightManager.bold,
                                  fontSize: FontSizeManager.s18,
                                ),
                                labelPadding: EdgeInsets.symmetric(
                                    horizontal: width * .1),
                                tabs: const [
                                  Tab(
                                    text: 'content',
                                  ),
                                  Tab(
                                    text: 'preview',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * .025,
                            ),
                            tabs[CoursesBloc.get(context).currentTab],
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: width * .025),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {},
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWeightManager.bold),
                        ),
                        color: ColorManager.primary,
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
Scaffold(
appBar:  defaultAppBar(title: 'Details' ,leading: Icons.arrow_back_ios, actions:
[
  Icons.bookmark
]),
      body:
      Padding(
        padding: const EdgeInsets.all(PaddingManager.p20),
        child: SingleChildScrollView (
          physics: BouncingScrollPhysics(),
          child: Column (
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:
            [
              Text(course.name , style:  TextStyle (fontSize: FontSizeManager.s22, fontWeight: FontWeightManager.maxWeight ),overflow:
              TextOverflow.ellipsis,maxLines: 2,),
             SizedBox(height: 20,),
             Container (
               decoration: BoxDecoration (
                 borderRadius: BorderRadius.circular(SizeManager.s15),
                   image: DecorationImage (image: NetworkImage (course.image!), fit: BoxFit.cover)),
               height: QueryValues.width(context) /1.5,
               width:  QueryValues.width(context),
             ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:  PaddingManager.p20),
                child: Row(
                  children: [
                    Text( "Course Content : " , style:
                    TextStyle (
                        color: ColorManager.primary,
                        fontSize: FontSizeManager.s22,
                        fontWeight: FontWeightManager.bold ),overflow:
                    TextOverflow.ellipsis,maxLines: 2,),
                    Spacer(),
                    Text('20 Videos & 7 Files' , style:
                    TextStyle (fontSize: FontSizeManager.s16, fontWeight: FontWeightManager.semiBold ),overflow:
                    TextOverflow.ellipsis,maxLines: 2,),
                  ],
                ),
              ),
               ListView.separated(
                 shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics (),
                   itemBuilder:  (context ,index )=> videoBuilder
                     (videosTest[index], context) ,
                   separatorBuilder: (context ,index )=>
                       SizedBox(height: 20,), itemCount: videosTest.length),
            ],
           ),
        ),
      ),

    );
 */

/*

 */

/*
   Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: QueryValues.width(context) / 5,
                            height: QueryValues.width(context) / 5,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: QueryValues.width(context) / 5,
                                  height: QueryValues.width(context) / 5,
                                  child: CircularProgressIndicator(
                                    value: course.completed / 100,
                                    color: ColorManager.primary,
                                    backgroundColor: ColorManager.grey1,
                                    strokeWidth: 10,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${course.completed} %',
                                    style: TextStyle(
                                      color: ColorManager.primary,
                                        fontWeight: FontWeightManager.bold,
                                        fontSize: FontSizeManager.s18),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(PaddingManager.p10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'You had Completed ',
                                      style: TextStyle(
                                        fontSize: FontSizeManager.s18,
                                        fontWeight: FontWeightManager.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '${course.completed}',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: FontSizeManager.s22,
                                        fontWeight: FontWeightManager.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      ' %',
                                      style: TextStyle(
                                        fontSize: FontSizeManager.s18,
                                        fontWeight: FontWeightManager.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                                Text(
                                  'of Course Content',
                                  style: TextStyle(
                                    fontSize: FontSizeManager.s18,
                                    fontWeight: FontWeightManager.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: SizeManager.s10,
                                ),
                                Row(
                                  children: [
                                    Text('Rate Us '),
                                    RatingStars(
                                      valueLabelVisibility: false,
                                      starColor: ColorManager.yellow,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: SizeManager.s20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Course Content : ",
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontSize: FontSizeManager.s22,
                                fontWeight: FontWeightManager.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Spacer(),
                          Text(
                            '20 Videos & 7 Files',
                            style: TextStyle(
                             // color: Colors.red,
                                fontSize: FontSizeManager.s16,
                                fontWeight: FontWeightManager.semiBold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
 */

/*
Scaffold(
        body: Stack (
      children: [
        Container(
          decoration: BoxDecoration(
            //      borderRadius: BorderRadius.circular(SizeManager.s15),
            color: ColorManager.grey2,

            image: DecorationImage(
              image: NetworkImage(
                course.image!,
              ),
              fit: BoxFit.fill,
            ),
          ),
          height: QueryValues.height(context) * .5,
          width: QueryValues.width(context),
        ),
        Padding(
          padding: const EdgeInsets.only (top: PaddingManager.p40),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(
              width: 50,
              height: 40,

              decoration: BoxDecoration (
                color: ColorManager.white,
                borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(20),
                bottomEnd: Radius.circular(20))
              ),
              child: IconButton(onPressed: (){},
                  icon: Icon(Icons.arrow_back_ios, color: ColorManager.primary,)),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(SizeManager.s50),
                    topLeft: Radius.circular(SizeManager.s50)),
                color: ColorManager.white,
              ),
              width: QueryValues.width(context),
              height: QueryValues.height(context) * .65,
              child: Padding(
                padding: const EdgeInsets.all(PaddingManager.p20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                       Text('Details', style: TextStyle(
                         color: ColorManager.primary,
                           fontWeight: FontWeightManager.bold ,
                         fontSize: FontSizeManager.s18
                       ),),
                      Icon(Icons.remove),

                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 20,),
                        child: Text(
                          course.name,
                          style: TextStyle(
                              color: ColorManager.black,
                              fontSize: FontSizeManager.s22,
                              fontWeight: FontWeightManager.maxWeight),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: QueryValues.width(context) / 5,
                            height: QueryValues.width(context) / 5,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: QueryValues.width(context) / 5,
                                  height: QueryValues.width(context) / 5,
                                  child: CircularProgressIndicator(
                                    value: course.completed / 100,
                                    color: ColorManager.primary,
                                    backgroundColor: ColorManager.grey1,
                                    strokeWidth: 10,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${course.completed} %',
                                    style: TextStyle(
                                        color: ColorManager.primary,
                                        fontWeight: FontWeightManager.bold,
                                        fontSize: FontSizeManager.s18),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(PaddingManager.p10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'You had Completed ',
                                      style: TextStyle(
                                        fontSize: FontSizeManager.s18,
                                        fontWeight: FontWeightManager.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '${course.completed}',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: FontSizeManager.s22,
                                        fontWeight: FontWeightManager.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      ' %',
                                      style: TextStyle(
                                        fontSize: FontSizeManager.s18,
                                        fontWeight: FontWeightManager.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                                Text(
                                  'of Course Content',
                                  style: TextStyle(
                                    fontSize: FontSizeManager.s18,
                                    fontWeight: FontWeightManager.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: SizeManager.s10,
                                ),
                                Row(
                                  children: [
                                    Text('Rate Us '),
                                    RatingStars(
                                      valueLabelVisibility: false,
                                      starColor: ColorManager.yellow,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              videoBuilder(videosTest[index], context),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                          itemCount: videosTest.length)


                    ],
                  ),
                ),
              ),
            ))
      ],
    ) ,

    )
 */
/// content
/*
 Column content = Column(
    children: [
      Padding(
        padding:
        const EdgeInsets.symmetric(vertical: PaddingManager.p20),
        child: Row(
          children: [
            Text(
              "Course Content : ",
              style: TextStyle(
                  color: ColorManager.primary,
                  fontSize: FontSizeManager.s22,
                  fontWeight: FontWeightManager.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const Spacer(),
            Text(
              '${course.videos.length} Videos & 7 Files',
              style: TextStyle(
                  fontSize: FontSizeManager.s16,
                  fontWeight: FontWeightManager.semiBold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      )
    ],
  );
 */
