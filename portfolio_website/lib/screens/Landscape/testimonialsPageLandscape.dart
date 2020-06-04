import 'package:portfolio_website/utilities/index.dart';

class TestimonialsPageLandscape extends StatelessWidget {
  List getElementsLength(int len) {
    List l = List();
    for (int count = 0; count < len; count++) l.add(count);
    return l;
  }

  Widget build(BuildContext context) {
    return CarouselSlider(
      items: getElementsLength(testimonials.length).map((i) {
        return FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    testimonials[i][0],
                    height: 400,
                    width: 350,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        FontAwesomeIcons.quoteLeft,
                        size: 40,
                      ),
                      SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: screenWidth(context) * 0.4,
                            child: Text(
                              testimonials[i][1],
                              maxLines: 10,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(testimonials[i][2]),
                          Text(testimonials[i][3]),
                        ],
                      ),
                    ],
                  ),
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
