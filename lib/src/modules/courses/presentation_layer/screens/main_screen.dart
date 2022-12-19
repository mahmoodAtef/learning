import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/core/utils/color_manager.dart';
import 'package:learning/src/modules/courses/presentation_layer/bloc/courses_bloc.dart';
import 'package:learning/src/modules/courses/presentation_layer/components/courses_components.dart';
import '../../../../core/utils/values_manager.dart';
import '../../domain_layer/entities/course.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = QueryValues.height(context);
    final double width = QueryValues.width(context);
    return BlocProvider(
  create: (context) => 
  CoursesBloc(CoursesInitial())..add(GetUserEvent(uid: 'atjZPpyM10e7a1U0jU8NW7wPA2j1'))..add(GetMostPopularCoursesEvent()),
  child: BlocConsumer<CoursesBloc, CoursesState> (
     listener: (context, state) {
       },
     builder: (context, state) {
       int index = CoursesBloc.get(context).currentIndex;
       return Scaffold(
         appBar: defaultAppBar
           (
             title: 'learning',
             // leading: IconButton(onPressed: (){
             //
             // },  icon: Icon(Icons.menu)),

             actions: [Icons.notifications]),
         drawer: Drawer(

child: Padding(
  padding:  EdgeInsetsDirectional.only(start: width * .051),
  child:   Column
    (
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(height: height * .09),
    SizedBox(height: height * .037),
    Text
      (
      'Welcome ${ CoursesBloc.get(context).user.name != null ? CoursesBloc.get(context).user.name: ".."  }',
      style: TextStyle
        (
     color: ColorManager.black,
     fontWeight: FontWeight.bold,
     fontSize: 33,
      ),
    ),
    SizedBox(height: height * .037),
      Row(
     children: [
       Icon(Icons.settings),
       SizedBox(width: height * .01),
       Text ("Settings"),
     ],
      ),

  ],),
),
         ),
         floatingActionButton: BlocBuilder<CoursesBloc, CoursesState>(
           builder: (context, state) {
             return FloatingActionButton(
               backgroundColor:
                   index != 2 ? ColorManager.white : ColorManager.primary,
               onPressed: () {
                 CoursesBloc.get(context)
                     .add(ChangeBottomNavEvent(index: 2));
               },
               child: Icon(
                 Icons.home,
                 color:
                     index == 2 ? ColorManager.white : ColorManager.primary,
               ),
             );
           },
         ),
         floatingActionButtonLocation:
             FloatingActionButtonLocation.centerDocked,
         bottomNavigationBar: BottomAppBar(
             shape: const CircularNotchedRectangle(),
             notchMargin: 7,
             elevation: 5,
             color: ColorManager.white,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 Expanded(
                     child: IconButton(
                   onPressed: () {
                     CoursesBloc.get(context)
                         .add(ChangeBottomNavEvent(index: 0));
                   },
                   icon: Icon(
                     Icons.video_collection,
                     color: index == 0
                         ? ColorManager.primary
                         : ColorManager.grey2,
                   ),
                 )),
                 Expanded(
                     child: IconButton(
                   onPressed: () {
                     CoursesBloc.get(context)
                         .add(ChangeBottomNavEvent(index: 1));
                   },
                   icon: Icon(
                     Icons.task,
                     color: index == 1
                         ? ColorManager.primary
                         : ColorManager.grey2,
                   ),
                 )),
                 SizedBox(
                   width: MediaQuery.of(context).size.width * .1,
                 ),
                 Expanded(
                     child: IconButton(
                   onPressed: () {
                     CoursesBloc.get(context)
                         .add(ChangeBottomNavEvent(index: 3));
                   },
                   icon: Icon(
                     Icons.shopping_cart,
                     color: index == 3
                         ? ColorManager.primary
                         : ColorManager.grey2,
                   ),
                 )),
                 Expanded(
                     child: IconButton(
                   onPressed: () {
                     CoursesBloc.get(context)
                         .add(ChangeBottomNavEvent(index: 4));
                   },
                   icon: Icon(Icons.school),
                   color: index == 4
                       ? ColorManager.primary
                       : ColorManager.grey2,
                 )),
               ],
             )),
         body: CoursesBloc.get(context).currentPage,
       );
     },
      ),
);
  }
}

List<Course> courses = [
  // Course(
  //     instructor: "ahmed",
  //     name: 'course 1 course 1 course 1 course 1 course 1 course 1 course 1 ',
  //
  //     image: 'https://www.bing.com/th?id=OIP.MZF3Wgi_8LDeVbwG1j92aA'
  //         'HaLH&w=204&h=306&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
  //     rating: 3.5, videos: [], rate: null),
  // Course(
  //     instructor: "ahmed",
  //     videos: videosTest,
  //     name: 'course 2 course 2 course 2 course 2 course 2 course 2 course 2 ',
  //     completed: 30,
  //     image:
  //         'https://www.bing.com/th?id=OIP.ANBtqtE3FBxuRPVc1n5qhAHaJ4&w=216&h=288&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
  //     rating: 4.5, rate: null),
  // Course(
  //   instructor: "ahmed",
  //   name:
  //       'course 3 course 3 course 3 course 3 course 3 course 3 course 3 course 3 course 3 course 3 course 3 course 3 course 3 course 3 ',
  //   image:
  //       'https://www.bing.com/th?id=OIP.rrK54QqzO3yBd9D8Ff6HfwHaEi&w=319&h=195&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
  // ),
  // Course(
  //     instructor: "ahmed",
  //     name: 'course 4 course 4 course 4 course 4 course 4 course 4 course 4 ',
  //     completed: 70,
  //     image:
  //         'https://www.bing.com/th?id=OIP.Xl24fgQvfe320Bv5HXp2DAHaEK&w=333&h=187&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
  //     rating: 1.5),
];
/*
 CarouselSlider(
              options: CarouselOptions(height: SizeManager.s200,
              enableInfiniteScroll: false,
              disableCenter: true,
              viewportFraction: .9,
              reverse: false, ),
              items: courses.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: onGoingBuilder(courses.indexOf(i), i),
                    );
                  },
                );
              }).toList(),
            )
*/

/*
Padding(
        padding: const EdgeInsets.all(PaddingManager.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text ('Ongoing Courses' , style: TextStyle (color: ColorManager.black ,
                fontSize: FontSizeManager.s22 , fontWeight: FontWeightManager.maxWeight,),),
            SizedBox(height: 30,),
            CarouselSlider(
              options: CarouselOptions(height: SizeManager.s200,
                enableInfiniteScroll: false,
                disableCenter: true,
                viewportFraction: .9,
                reverse: false, ),
              items: courses.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: onGoingBuilder(courses.indexOf(i), i),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: SizeManager.s20,),
            Row(
              children: [
                Text ('Most Popular  ' , style: TextStyle (color: ColorManager.black ,
                  fontSize: FontSizeManager.s22 , fontWeight: FontWeightManager.maxWeight,),),
                Icon( Icons.local_fire_department, color: Colors.deepOrange, size: 30,),
                Spacer(),
                TextButton(
                    onPressed: (){}, child: Row(
                  children: [
                    Text('View all' , style: TextStyle(color:
                    ColorManager.primary, fontWeight: FontWeightManager.bold,
                        fontSize: FontSizeManager.s16 ,  ),),
                    Icon(Icons.keyboard_arrow_right, color: ColorManager.primary,)
                  ],
                ),
                )
              ],
            ),
            SizedBox(height: 30,),
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
          ],
        ),
      )
 */
