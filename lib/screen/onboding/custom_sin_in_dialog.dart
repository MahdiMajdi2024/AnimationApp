import 'package:animated_app/screen/onboding/sing_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


Future<Object?> CustomSinInDialog(BuildContext context,{required ValueChanged onClosed}) {
  return showGeneralDialog(
    ///lets close it while tap outside
    /// add the close btn at the bottom
    barrierDismissible: true,
    barrierLabel: 'Sing In',
    transitionDuration: Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child){
      Tween<Offset> tween;
      tween = Tween(begin: Offset(-1, -2), end:  Offset.zero,);
      return SlideTransition(
        position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOutCubicEmphasized)
        ),
        child: child,
      );
    },
    context: context,
    pageBuilder: (context, _, _) {
      return Center(
        child: Container(
          margin: EdgeInsetsGeometry.symmetric(horizontal: 16),
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 34),
          height: 644,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.94),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Sing In',
                      style: TextStyle(fontSize: 34, fontFamily: 'Poppins'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SignInForm(),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'OR',
                            style: TextStyle(color: Colors.black26),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Sing up with Email, Apple or Google',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/email_box.svg',
                            height: 54,
                            width: 54,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/apple_box.svg',
                            height: 54,
                            width: 54,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/google_box.svg',
                            height: 54,
                            width: 54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Positioned(
                    bottom: -58,
                    left: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close, color: Colors.black,
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      );
    },
  ).then(onClosed);
}