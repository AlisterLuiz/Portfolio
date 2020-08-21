import 'package:Portfolio/utilities/index.dart';
import 'package:Portfolio/widgets/animations/testimonialScreenAnimation.dart';

class TestimonialsPageLandscape extends StatefulWidget {
  @override
  _TestimonialsPageLandscapeState createState() =>
      _TestimonialsPageLandscapeState();
}

class _TestimonialsPageLandscapeState extends State<TestimonialsPageLandscape>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  TestimonialsScreenAnimation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
    animation = TestimonialsScreenAnimation(controller);
  }

  Widget build(BuildContext context) {
    final testimonials = Provider.of<List<Testimonials>>(context);
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) => FadeTransition(
        opacity: animation.containerOpacity,
        child: CarouselSlider(
          items: getElementsLength(testimonials.length).map((i) {
            return Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: getTestimonialsImage(
                      context, testimonials, i, 1, animation),
                ),
                SizedBox(width: 30),
                Expanded(
                  flex: 3,
                  child: getTestimonialsData(
                      context, testimonials, i, 1, animation),
                ),
              ],
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(
              seconds: 5,
            ),
            viewportFraction: 1,
            height: screenHeight(context) * 0.72,
            onPageChanged: (i, reason) {},
          ),
        ),
      ),
    );
  }
}
