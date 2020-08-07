import 'package:portfolio_website/utilities/index.dart';

class TestimonialsPagePortrait extends StatelessWidget {
  List getElementsLength(int len) {
    List l = List();
    for (int count = 0; count < len; count++) l.add(count);
    return l;
  }

  Widget build(BuildContext context) {
    final testimonials = Provider.of<List<Testimonials>>(context);
    return CarouselSlider(
      items: getElementsLength(testimonials.length).map(
        (i) {
          return ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: getTestimonialsImage(context, testimonials, i, 2)),
              SizedBox(height: 20),
              Expanded(
                child: getTestimonialsData(context, testimonials, i, 2),
              ),
            ],
          );
        },
      ).toList(),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(
          seconds: 4,
        ),
        viewportFraction: 1,
        height: screenHeight(context) * 1.1,
      ),
    );
  }
}
