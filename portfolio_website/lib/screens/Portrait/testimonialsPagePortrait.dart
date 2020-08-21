import 'package:Portfolio/utilities/index.dart';
import 'package:Portfolio/widgets/animations/testimonialScreenAnimation.dart';

class TestimonialsPagePortrait extends StatefulWidget {
  @override
  _TestimonialsPagePortraitState createState() =>
      _TestimonialsPagePortraitState();
}

class _TestimonialsPagePortraitState extends State<TestimonialsPagePortrait>
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
    // controller.forward();
    animation = TestimonialsScreenAnimation(controller);
  }

  List getElementsLength(int len) {
    List l = List();
    for (int count = 0; count < len; count++) l.add(count);
    return l;
  }

  Widget build(BuildContext context) {
    final testimonials = Provider.of<List<Testimonials>>(context);
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) => CarouselSlider(
        items: getElementsLength(testimonials.length).map(
          (i) {
            return ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getTestimonialsImage(context, testimonials, i, 2, animation),
                SizedBox(height: 20),
                getTestimonialsData(context, testimonials, i, 2, animation),
              ],
            );
          },
        ).toList(),
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayInterval: Duration(
            seconds: 5,
          ),
          viewportFraction: 1,
          height: screenHeight(context),
        ),
      ),
    );
  }
}
