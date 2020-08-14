import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/widgets/animations/aboutScreenAnimation.dart';

class AboutPageLandscape extends StatefulWidget {
  @override
  _AboutPageLandscapeState createState() => _AboutPageLandscapeState();
}

class _AboutPageLandscapeState extends State<AboutPageLandscape>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  AboutScreenAnimation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    controller.forward();
    animation = AboutScreenAnimation(controller);
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getContactCard(context, 0.35, () => setState(() {}), animation),
              getExperience(context, 0.35, animation)
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
