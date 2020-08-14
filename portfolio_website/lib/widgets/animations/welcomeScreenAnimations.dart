import 'package:portfolio_website/utilities/index.dart';

class WelcomeScreenAnimation {
  WelcomeScreenAnimation(this.controller)
      : imageOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.3, curve: Curves.easeIn),
          ),
        ),
        imagePosition =
            Tween<Offset>(begin: Offset(0, 0), end: Offset(255, 0)).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.4, curve: Curves.easeIn),
          ),
        ),
        containerWidth = Tween<double>(begin: 0, end: 60).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.3, 0.4, curve: Curves.easeIn),
          ),
        ),
        icon1Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.4, 0.5, curve: Curves.easeIn),
          ),
        ),
        icon2Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.45, 0.5, curve: Curves.easeIn),
          ),
        ),
        icon3Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.55, curve: Curves.easeIn),
          ),
        ),
        descOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.55, 0.65, curve: Curves.easeIn),
          ),
        ),
        descOffset =
            Tween<Offset>(begin: const Offset(0.35, 0.0), end: Offset.zero)
                .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.55, 0.65, curve: Curves.easeIn),
          ),
        ),
        button1Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.65, 0.75, curve: Curves.easeIn),
          ),
        ),
        button2Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.75, 0.85, curve: Curves.easeIn),
          ),
        ),
        button3Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.85, 0.95, curve: Curves.easeIn),
          ),
        );

  final AnimationController controller;
  final Animation<double> imageOpacity;
  final Animation<Offset> imagePosition;
  final Animation<double> containerWidth;
  final Animation<double> icon1Opacity;
  final Animation<double> icon2Opacity;
  final Animation<double> icon3Opacity;
  final Animation<double> descOpacity;
  final Animation<Offset> descOffset;
  final Animation<double> button1Opacity;
  final Animation<double> button2Opacity;
  final Animation<double> button3Opacity;
}
