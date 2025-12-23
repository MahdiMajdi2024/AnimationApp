import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../model/rive_asset.dart';


class SideMenuTile extends StatelessWidget {
  const SideMenuTile({super.key, required this.menu, required this.press, required this.riveonInit, required this.isActive});

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool isActive;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Divider(color: Colors.white24, height: 1.5),
        ),
        Stack(
          children: [
             AnimatedPositioned(
               duration: Duration(milliseconds: 300),
              height: 56,
              width: isActive ?288 : 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff6792ff),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                width: 34,
                height: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard ,
                  onInit: riveonInit,
                ),
              ),
              title: Text(menu.title, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }
}
