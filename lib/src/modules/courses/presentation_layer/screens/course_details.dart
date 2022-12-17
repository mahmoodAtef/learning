import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../domain_layer/entities/course.dart';
import '../components/courses_components.dart';

class CourseDetails extends StatelessWidget {
  Course course;
  bool isOwned = true;
  CourseDetails({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  defaultAppBar (title: 'Details' ,leading: IconButton(onPressed: (){},
          icon: Icon(Icons.arrow_back_ios)), actions:
      [
        Icons.bookmark
      ]),
      body:
      Padding(
        padding: const EdgeInsets.all(PaddingManager.p20),
        child: SingleChildScrollView (
          physics: const BouncingScrollPhysics(),
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
                height: QueryValues.width(context) /2,
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
                        fontWeight: FontWeightManager.bold ),
                      overflow:
                    TextOverflow.ellipsis,maxLines: 2,),
                    const Spacer(),
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
              Padding
                (
              padding: const EdgeInsets.symmetric(vertical: PaddingManager.p10),
              child: MaterialButton(onPressed: (){}, child: Text('More Details ', style: TextStyle(color: ColorManager.white, fontWeight: FontWeightManager.bold),), color: ColorManager.primary, elevation: 5,),
            ),

            ],
          ),
        ),
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