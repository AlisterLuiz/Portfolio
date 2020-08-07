import 'package:portfolio_website/utilities/index.dart';

class TestimonialsPageLandscape extends StatelessWidget {
  Widget build(BuildContext context) {
    final testimonials = Provider.of<List<Testimonials>>(context);
    return CarouselSlider(
      items: getElementsLength(testimonials.length).map((i) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: getTestimonialsImage(context, testimonials, i, 1),
            ),
            SizedBox(width: 30),
            Expanded(
              flex: 3,
              child: getTestimonialsData(context, testimonials, i, 1),
            ),
          ],
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(
          seconds: 4,
        ),
        viewportFraction: 1,
        // height: screenHeight(context) * 1.8,
      ),
    );
  }
}
