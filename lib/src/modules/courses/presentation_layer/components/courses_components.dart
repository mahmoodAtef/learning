import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_data.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/font_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../../domain_layer/entities/course.dart';
import '../../domain_layer/entities/video.dart';

Widget courseBuilder({required Course course , context, }) {
  return InkWell(
    child:  Container (
      clipBehavior: Clip.antiAliasWithSaveLayer,
        width: MediaQuery.of(context).size.width *.6,
        height:  MediaQuery.of(context).size.width * .7,
        decoration: const BoxDecoration (borderRadius: BorderRadius.only(topLeft: Radius.circular(55)  ,
            topRight: const Radius.circular(55) )),
        child: Card (
          child: Column (
          children: [
            Container(
           height :  MediaQuery.of(context).size.width * .5,
              decoration: const BoxDecoration (image:
            const DecorationImage(image: const NetworkImage(''
                'https://photo-cdn2.icons8.com/eSz8riIW0lCe9I4G7drTXJV2hp4W31F03_SJlOb6R-w/rs:fit:1590:1072/wm:1:re:0:0:0.65/wmid:moose/q:98/czM6Ly9pY29uczgu/bW9vc2UtcHJvZC5h/c3NldHMvYXNzZXRz/L3NhdGEvb3JpZ2lu/YWwvNTUxL2QzYmZi/OWI3LTU1YjUtNDIz'
                '/Zi1iZWQyLWUyN2Uz/MWVkMTY2MC5qcGc.jpg'
            , ) , fit: BoxFit.cover)),),

            Expanded(child: Container(
              padding: EdgeInsets.zero,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text ( 'Course Name name Course Name Course Name Course Test Course Test Course Test' ,
                      style: TextStyle
                        (overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeightManager.bold ,
                          fontSize: FontSizeManager.s18,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 3,),
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
                       valueLabelColor:  ColorManager.white,
                       valueLabelTextStyle:  TextStyle(
                           color: ColorManager.black,
                         fontWeight: FontWeight.w900,
                      //     fontStyle: FontStyle.normal,
                           fontSize: 15.0),
                      //valueLabelRadius: 10,
                      maxValue: 5,
                      valueLabelPadding: EdgeInsets.only(left: 5),
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
          clipBehavior:
          Clip.antiAliasWithSaveLayer,
        )
    )
  );
}
Widget onGoingBuilder(int i , Course course){
  return  i % 2 == 0 ?
 Container(
    width: 330,
   padding: const EdgeInsets.all(PaddingManager.p10),
   decoration:  BoxDecoration (color: ColorManager.primary,
    borderRadius: BorderRadius.circular(SizeManager.s50),
   ),
   height: 200,
// width: 400,
   child: Column(children:
   [
     Expanded(
       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Row(children: [
           Container(
             width: 60,
             height: 60,
             decoration:  BoxDecoration (color: ColorManager.white,
               borderRadius: BorderRadius.circular(SizeManager.s8, ),
               image: DecorationImage (image: NetworkImage(course.image!))
             ),
           ),
           const SizedBox(width: 20,),
           Expanded(child: Text(course.name, style: TextStyle
             (color:
           ColorManager.white , fontWeight:
           FontWeightManager.bold,
               fontSize: FontSizeManager.s18), maxLines: 2 ,overflow: TextOverflow.ellipsis,))
         ],),
       ),
     ),
     Expanded(
       child: Slider(value: 90, // Todo: Complete this
         onChanged: (value){} , activeColor:
         ColorManager.yellow,max: 100,min: 0,thumbColor: ColorManager.yellow,),
     ),
     Text("Competed ${90} %", style: TextStyle(color: ColorManager.white),)

   ],),

 ) : Container(
    padding: const EdgeInsets.all(PaddingManager.p10),
    decoration:  BoxDecoration (color: ColorManager.yellow,
      borderRadius: BorderRadius.circular(SizeManager.s50),
    ),
    height: SizeManager.s200,
    width: 330,
// width: 400,
    child: Column(children:
    [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
            Container(
              width: 60,
              height: 60,
              decoration:  BoxDecoration (color: ColorManager.white,
                  borderRadius: BorderRadius.circular(SizeManager.s8, ),
                  image: DecorationImage (image: NetworkImage(course.image!))
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(child: Text(course.name, style: TextStyle
              (color:
            ColorManager.white , fontWeight:
            FontWeightManager.bold,
                fontSize: FontSizeManager.s18), maxLines: 2 ,overflow: TextOverflow.ellipsis,))
          ],),
        ),
      ),
      Expanded(
        child: Slider(value: 60,
          onChanged: (value){} , activeColor:
          ColorManager.primary,max: 100,min: 0,thumbColor: ColorManager.primary,),
      ),
      Text("Competed ${60} %", style: TextStyle(color: ColorManager.white),)

    ],),

  );
}

AppBar defaultAppBar ({ required String  title ,
  Widget ? leading , List <IconData>? actions ,  }){
  return AppBar(

    backgroundColor: ColorManager.white,
    centerTitle: true,
    title: Text(
      title!,
    ),
    leading: leading ?? null,
    actions : actions != null ? actions.map((e) =>  Padding(
      padding : const EdgeInsets.all(PaddingManager.p8),
      child: Padding(
        padding : const EdgeInsets.all(PaddingManager.p8),
        child: Icon
          (
          e,
        ),
      ),
    )).toList() : null ,
    shape: StadiumBorder(),

  );
}

Widget videoBuilder (Video video, BuildContext context)
{
  return Card(

    child: InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.zero,
padding: EdgeInsets.zero,
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(SizeManager.s15),
         ),
        clipBehavior: Clip.antiAlias,
        child: Container (
          width: QueryValues.width(context)  ,
          height: QueryValues.width(context) /5  ,
          padding: EdgeInsets.all(PaddingManager.p10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 10),
              child: Stack(
                children: [
                  Container (
                    height: QueryValues.width(context) / 5 ,
                    width: QueryValues.width(context) /5,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.all(Radius.circular(SizeManager.s10)),
                      image: DecorationImage (image: NetworkImage (video.image),  fit: BoxFit.cover)
                    ),
                  ),
                  Container
                    (
                    height: QueryValues.width(context) / 5 ,
                    width: QueryValues.width(context) /5,
                    decoration: BoxDecoration (
                      color: ColorManager.black.withOpacity(.4),
                        borderRadius: BorderRadius.all(Radius.circular(SizeManager.s10)),
                    ),
                    child: Center(child: Icon ( Icons.play_circle, color: ColorManager.grey1,)),
                  )
                ],
              ),
            ),

            Expanded(child: Column
              (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text ( video.title ?? 'UnTitled Video ' , style: TextStyle
                  (fontSize: FontSizeManager.s16, fontWeight: FontWeightManager.bold , color: ColorManager.black),
                maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text ( video.time,
                  style: TextStyle (
                      fontSize: FontSizeManager.s14,
                    fontWeight: FontWeightManager.bold ,
                  color: ColorManager.grey2 ),),
              ],
            )) ,
            Icon(Icons.arrow_forward_ios)
          ],
        ),),
      ),
    ),
  );
}
List  <Video> videosTest  =
[
  Video(url: '', image: 'https://www.bing.com/th?id=OIP.MZF3Wgi_8LDeVbwG1j92aA'
      'HaLH&w=204&h=306&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', time: '20:02', title: 'Video 1 Title Video 1 Title Video 1 Title Video 1 Title Video 1 TitleVideo 1 Title Video 1 Title Video 1 Title Video 1 Title '),
  Video(url: '', image: 'https://www.bing.com/th?id=OIP.MZF3Wgi_8LDeVbwG1j92aA'
      'HaLH&w=204&h=306&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', time: '20:02',),
  Video(url: '', image: 'https://www.bing.com/th?id=OIP.MZF3Wgi_8LDeVbwG1j92aA'
      'HaLH&w=204&h=306&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', time: '20:02', title: 'Video 1 Title Video 1 Title Video 1 Title Video 1 Title Video 1 TitleVideo 1 Title Video 1 Title Video 1 Title Video 1 Title '),
  Video(url: '', image: 'https://www.bing.com/th?id=OIP.MZF3Wgi_8LDeVbwG1j92aA'
      'HaLH&w=204&h=306&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', time: '20:02', title: 'Video 1 Title Video 1 Title Video 1 Title Video 1 Title Video 1 TitleVideo 1 Title Video 1 Title Video 1 Title Video 1 Title '),
  Video (url: '', image: 'https://www.bing.com/th?id=OIP.MZF3Wgi_8LDeVbwG1j92aA'
      'HaLH&w=204&h=306&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', time: '20:02', title: 'Video 1 Title Video 1 Title Video 1 Title Video 1 Title Video 1 TitleVideo 1 Title Video 1 Title Video 1 Title Video 1 Title '),


];
class CourseTest extends StatelessWidget {
  const CourseTest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(backgroundColor: ColorManager.primary,),
      body:
      Center(child: courseBuilder(course: Course (name: 'lol', rate: 3.5,  instructor:  "ahmed",videos: [], rating: 2.2) , context: context , ),),);
  }
}

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