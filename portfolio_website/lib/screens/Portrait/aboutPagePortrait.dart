import 'package:Portfolio/utilities/index.dart';
import 'package:Portfolio/widgets/animations/aboutScreenAnimation.dart';

class AboutPagePortrait extends StatefulWidget {
  @override
  _AboutPagePortraitState createState() => _AboutPagePortraitState();
}

class _AboutPagePortraitState extends State<AboutPagePortrait>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  AboutScreenAnimation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
    animation = AboutScreenAnimation(controller);
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) => ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight(context) * 0.43,
                child: getContactCard(
                    context, 0.8, () => setState(() {}), animation),
              ),
              // SizedBox(
              //   height: 30,
              // ),
              Container(
                height: screenHeight(context) * 0.4,
                child: getExperience(context, 0.7, animation),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
