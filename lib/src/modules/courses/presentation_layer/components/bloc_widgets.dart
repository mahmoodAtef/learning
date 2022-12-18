import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_course.dart';
import 'package:learning/src/modules/courses/presentation_layer/bloc/courses_bloc.dart';

import 'courses_components.dart';

class OnGoingWidget extends StatelessWidget {
  const OnGoingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<OnGoingCourse> onGoingCourses =
        CoursesBloc.get(context).onGoingCourses;
    return BlocBuilder<CoursesBloc, CoursesState>(
      builder: (context, state) {
        return state is GetOnGoingLoadingState
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: 200,
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => onGoingBuilder(
                          index,
                          onGoingCourses[index],
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                    itemCount: onGoingCourses.length,
                    scrollDirection: Axis.horizontal),
              );
      },
    );
  }
}
