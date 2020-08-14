import 'package:portfolio_website/utilities/index.dart';

class TestimonialsScreenAnimation {
  TestimonialsScreenAnimation(this.controller)
      : text1Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.2, 0.3, curve: Curves.easeIn),
          ),
        ),
        text2Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.3, 0.4, curve: Curves.easeIn),
          ),
        ),
        text3Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.4, 0.5, curve: Curves.easeIn),
          ),
        ),
        iconOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.1, 0.2, curve: Curves.easeIn),
          ),
        ),
        containerOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.1, curve: Curves.easeIn),
          ),
        );

  final AnimationController controller;
  final Animation<double> containerOpacity;
  final Animation<double> iconOpacity;
  final Animation<double> text1Opacity;
  final Animation<double> text2Opacity;
  final Animation<double> text3Opacity;
}
