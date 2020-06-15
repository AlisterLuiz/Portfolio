import 'package:portfolio_website/utilities/index.dart';

class TestimonialsPagePortrait extends StatelessWidget {
  List getElementsLength(int len) {
    List l = List();
    for (int count = 0; count < len; count++) l.add(count);
    return l;
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          items: getElementsLength(testimonials.length).map(
            (i) {
              return Container(
                // width: screenWidth(context) * 0.6,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getTestimonialsImage(context, i, 2),
                    SizedBox(height: 20),
                    getTestimonialsData(context, i, 2)
                  ],
                ),
              );
            },
          ).toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(
              seconds: 3,
            ),
            height: screenHeight(context) * 0.8,
          ),
        ),
      ],
    );
  }
}
