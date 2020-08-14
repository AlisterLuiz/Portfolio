import 'package:portfolio_website/utilities/index.dart';

class AboutScreenAnimation {
  AboutScreenAnimation(this.controller)
      : contactOffset =
            Tween<Offset>(begin: Offset(-2, 0), end: Offset(0, 0)).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.4, curve: Curves.easeIn),
          ),
        ),
        text1Offset =
            Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0)).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.3, 0.5, curve: Curves.easeIn),
          ),
        ),
        text2Offset =
            Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0)).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.6, curve: Curves.easeIn),
          ),
        ),
        text3Offset =
            Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0)).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.6, 0.7, curve: Curves.easeIn),
          ),
        ),
        number1 = Tween<double>(begin: 0, end: 3).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.6, 1.0, curve: Curves.easeIn),
          ),
        ),
        number2 = Tween<double>(begin: 0, end: 16).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.6, 1.0, curve: Curves.easeIn),
          ),
        );

  final AnimationController controller;
  final Animation<Offset> contactOffset;
  final Animation<Offset> text1Offset;
  final Animation<Offset> text2Offset;
  final Animation<Offset> text3Offset;
  final Animation<double> number1;
  final Animation<double> number2;
}
