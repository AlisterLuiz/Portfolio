import 'package:Portfolio/utilities/index.dart';

class BlogsScreenAnimation {
  BlogsScreenAnimation(this.controller)
      : textOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0, 0.1, curve: Curves.easeIn),
          ),
        ),
        icon1Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.1, 0.2, curve: Curves.easeIn),
          ),
        ),
        icon2Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.2, 0.3, curve: Curves.easeIn),
          ),
        ),
        containerOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.3, 0.5, curve: Curves.easeIn),
          ),
        );

  final AnimationController controller;
  final Animation<double> textOpacity;
  final Animation<double> icon1Opacity;
  final Animation<double> icon2Opacity;
  final Animation<double> containerOpacity;
}
