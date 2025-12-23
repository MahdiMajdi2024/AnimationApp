import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 25 : 0,
      decoration: BoxDecoration(
          color: Color(0xff81b4ff),
          borderRadius: BorderRadius.circular(12)
      ),
    );
  }
}