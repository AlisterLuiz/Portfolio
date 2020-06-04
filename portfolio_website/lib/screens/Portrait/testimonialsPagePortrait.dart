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
                width: screenWidth(context) * 0.6,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      testimonials[i][0],
                      height: screenHeight(context) * 0.4,
                      width: screenWidth(context) * 0.6,
                    ),
                    SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.quoteLeft,
                          size: 30,
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AutoSizeText(
                              testimonials[i][1],
                              maxLines: 5,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 30),
                            AutoSizeText(testimonials[i][2]),
                            AutoSizeText(testimonials[i][3]),
                          ],
                        ),
                      ],
                    ),
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
            height: screenHeight(context) * 0.85,
          ),
        ),
      ],
    );
  }
}
