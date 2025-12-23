import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/courses.dart';
import 'courses_cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Courses',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...courses
                        .map(
                          (courses) => Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CoursesCart(courses: courses),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Recent',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                ),
              ),
              ...recentCourses.map(
                (courses) => Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
                  child: SecondaryCoursesCart(courses: courses),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryCoursesCart extends StatelessWidget {
  const SecondaryCoursesCart({super.key, required this.courses});

  final Courses courses;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        color: courses.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  courses.title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Watch video -15 mains',
                  style: TextStyle(fontSize: 16, color: Colors.white60),
                ),
              ],
            ),
          ),
          SizedBox(height: 40, child: VerticalDivider(color: Colors.white70)),
          SizedBox(width: 8),
          SvgPicture.asset(courses.iconSrc),
        ],
      ),
    );
  }
}
