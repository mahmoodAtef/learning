import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/core/utils/color_manager.dart';
import 'package:learning/src/core/utils/values_manager.dart';
import 'package:learning/src/modules/courses/presentation_layer/components/courses_components.dart';
import 'package:learning/src/modules/courses/presentation_layer/screens/main_screen.dart';

import '../../../../core/utils/font_manager.dart';
import '../components/bloc_widgets.dart';

class Home extends StatelessWidget
{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(PaddingManager.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text ('Ongoing Courses' , style: TextStyle (color: ColorManager.black ,
            fontSize: FontSizeManager.s22 , fontWeight: FontWeightManager.maxWeight,),),
         // SizedBox(height: 30,),
         OnGoingWidget (),
         // SizedBox(height: SizeManager.s20,),
          Row
            (
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text ('Most Popular ' , style:
              TextStyle
                (
                color: ColorManager.black ,
                fontSize: FontSizeManager.s22 , fontWeight: FontWeightManager.maxWeight,),),
              Icon( Icons.local_fire_department, color: Colors.deepOrange, size: 26,),
              Spacer(),
              TextButton(
                onPressed: (){}, child: Row (
                children: [
                  Text('View all' , style: TextStyle(
                    color: ColorManager.primary,
                    fontWeight: FontWeightManager.bold,
                    fontSize: FontSizeManager.s14 ,  ),),
                  Icon(Icons.keyboard_arrow_right, color: ColorManager.primary,)
                ],
              ),
              )
            ],
          ),
          //SizedBox(height: 25,),
           MostPopularWidget ()
        ],
      ),
    );
  }
}
/*
courses.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: onGoingBuilder(courses.indexOf(i), i),
                  );
                },
              );
            }).toList(),

 */

/* course
  CarouselSlider(
            options: CarouselOptions(

              height:  MediaQuery.of(context).size.width * .7,
              enableInfiniteScroll: false,
              disableCenter: true,
              viewportFraction: .7,
              reverse: false, ),
            items: courses.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: courseBuilder(course: i, context: context  ,),
                  );
                },
              );
            }).toList(),
          )
 */