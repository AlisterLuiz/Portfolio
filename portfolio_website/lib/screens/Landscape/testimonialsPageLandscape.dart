import 'package:portfolio_website/utilities/index.dart';

class TestimonialsPageLandscape extends StatelessWidget {
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: getElementsLength(testimonials.length).map((i) {
        return FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  getTestimonialsImage(context, i, 1),
                  getTestimonialsData(context, i, 1),
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
      ),
    );
  }
}
