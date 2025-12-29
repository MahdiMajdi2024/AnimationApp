import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide Image;
import 'animation_button.dart';
import 'custom_sin_in_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;
  bool isSingInDialogShown = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _btnAnimationController = OneShotAnimation(
      'active',
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ///at the end of the video i will  show you
          ///How to create the animation on Rive
          ///lets add blur
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 10, sigmaX: 20),
            ),
          ),
          RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 30, sigmaX: 30),
              child: SizedBox(),
            ),
          ),

          ///lets add text
          AnimatedPositioned(
            top: isSingInDialogShown ? -50 : 0,
            duration: Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: [
                          Text(
                            'Learn design & code',
                            style: TextStyle(
                              fontSize: 60,
                              height: 1.2,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Dont skip design. Learn design and code,by building real apps with Flutter and Swift. Complete courses about the best tools.',
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 2),

                    ///Its Time to add the animation button
                    AnimationButton(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        ///See now once you tap it
                        ///it show the animation
                        ///but on restart it play it once
                        ///lets stop it
                        _btnAnimationController.isActive = true;
                        Future.delayed(Duration(milliseconds: 800), () {
                          setState(() {
                            isSingInDialogShown = true;
                          });
                          customSigninDialog(
                            context,
                            onCLosed: (_) {
                              setState(() {
                                isSingInDialogShown = false;
                              });
                            },
                          );

                          ///Lets add the slide animation  while dialog show
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        'Purchase includes access to 30+ courses, premium tutorials, 120+ hours of videos, source files and certificates.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
