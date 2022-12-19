import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/core/utils/values_manager.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_course.dart';
import 'package:learning/src/modules/courses/presentation_layer/bloc/courses_bloc.dart';

import '../../domain_layer/entities/course.dart';
import 'courses_components.dart';

class OnGoingWidget extends StatelessWidget {
  const OnGoingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesBloc, CoursesState>(
      builder: (context, state) {
        List<OnGoingCourse> onGoingCourses =
            CoursesBloc.get(context).onGoingCourses;
        return onGoingCourses == []
            ? const Center(
                child: Text("no courses yet.."),
              )
            : SizedBox(
                height: QueryValues.width(context) / 2,
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

class MostPopularWidget extends StatelessWidget {
  const MostPopularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesBloc, CoursesState>(
      bloc: CoursesBloc.get(context),
      builder: (context, state) {
        List<Course> mostPopular = CoursesBloc.get(context).mostPopular;
        return mostPopular.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.width * .7,
                child: Center(
                  child: Text("no courses yet.."),
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.width * .7,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => courseBuilder(
                        course: mostPopular[index], context: context),
                    separatorBuilder: (context, index) => SizedBox(width: 16),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal),
              );
      },
    );
  }
}
