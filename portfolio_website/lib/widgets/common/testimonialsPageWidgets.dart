import 'package:portfolio_website/utilities/index.dart';

Column getTestimonialsData(
    BuildContext context, List<Testimonials> testimonials, i, int orientation) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        FontAwesomeIcons.quoteLeft,
        size: 40,
      ),
      SizedBox(height: 10),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          (orientation == 1)
              ? Container(
                  width: screenWidth(context) * 0.5,
                  child: getTestimonial(testimonials, i, orientation),
                )
              : getTestimonial(testimonials, i, orientation),
          SizedBox(height: 30),
          AutoSizeText(
            testimonials[i].name,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: screenWidth(context) * 0.5,
            child: AutoSizeText(
              testimonials[i].position,
              maxLines: 2,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

AutoSizeText getTestimonial(
    List<Testimonials> testimonials, i, int orientation) {
  return AutoSizeText(
    testimonials[i].content,
    textAlign: TextAlign.justify,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget getTestimonialsImage(
    BuildContext context, List<Testimonials> testimonials, i, int orientation) {
  return Image.network(
    testimonials[i].photo,
    height: (orientation == 1)
        ? screenHeight(context) * 0.6
        : screenHeight(context) * 0.4,
    width: (orientation == 1)
        ? screenWidth(context) * 0.3
        : screenWidth(context) * 0.6,
    fit: BoxFit.fill,
  );
}
