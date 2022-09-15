import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:sparks_bank/modules/Layout.dart';
import 'package:sparks_bank/modules/WelcomeScreen.dart';

class SplashScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return AnimatedSplashScreen(
      splash: 'assets/images/Mobile-banking.jpg',
      splashIconSize: 230,
      nextScreen: Layout(),
      splashTransition: SplashTransition.rotationTransition,
     // pageTransitionType: PageTransitionType.scale,
    );
    throw UnimplementedError();
  }

}