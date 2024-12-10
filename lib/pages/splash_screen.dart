import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nba_highlights/utils/router.dart';
import 'package:nba_highlights/utils/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    // initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    // create bouncing animation
    _bounceAnimation = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticInOut,
    ));

    // Start animation
    _animationController.repeat(reverse: true);

    // Navigate to category screen after 3 seconds
    Timer(
      Duration(seconds: 3),
      () => AppRouter.router.go("/categories"),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Animated logo
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _bounceAnimation.value),
                child: child,
              );
            },
            child: Container(
                height: 150,
                width: 150,
                child: Image(image: AssetImage("assets/icons/logo.png"))),
          ),
          // logo text
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "NBA Highlights",
              style: AppTextStyles.splash,
            ),
          ),
        ],
      )),
    ));
  }
}
