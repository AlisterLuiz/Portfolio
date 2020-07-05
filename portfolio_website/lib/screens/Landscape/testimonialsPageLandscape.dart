import 'package:portfolio_website/utilities/index.dart';

class TestimonialsPageLandscape extends StatelessWidget {
  Widget build(BuildContext context) {
    final testimonials = Provider.of<List<Testimonials>>(context);
    return CarouselSlider(
      items: getElementsLength(testimonials.length).map((i) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getTestimonialsImage(context, testimonials, i, 1),
                  SizedBox(width: 30),
                  getTestimonialsData(context, testimonials, i, 1),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(
          seconds: 3,
        ),
        viewportFraction: 1,
        // height: screenHeight(context) * 1.8,
      ),
    );
  }
}
