
import 'dart:ui';

class Courses {
  final String title, description, iconSrc;
  final Color bgColor;

  Courses({
    required this.title,
    this.description = 'Build and Animation an iOS from scratch',
    this.iconSrc = 'assets/icons/code.svg',
    this.bgColor = const Color(0xff7553f6)
  });
}

List<Courses> courses = [
  Courses(title: 'Animation in SwiftUtI'),
  Courses(title: 'Animation in Flutter',
      iconSrc: 'assets/icons/code.svg',
      bgColor: const Color(0xff80a4ff)
  ),
];


List<Courses> recentCourses = [
  Courses(title: 'State Machine'),
  Courses(
      title: 'Animation Menu',
      iconSrc: 'assets/icons/ios.svg',
      bgColor: const Color(0xff9cc5ff)
  ),
  Courses(title: 'Flutter with Rive'),
  Courses(
      title: 'Animation Menu',
      iconSrc: 'assets/icons/ios.svg',
      bgColor: const Color(0xff9cc5ff)
  ),
];