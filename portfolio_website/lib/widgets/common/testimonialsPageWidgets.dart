import 'package:portfolio_website/utilities/index.dart';

Column getTestimonialsData(BuildContext context, i, int orientation) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          (orientation == 1)
              ? Container(
                  width: screenWidth(context) * 0.4,
                  child: getTestimonial(i, orientation),
                )
              : getTestimonial(i, orientation),
          SizedBox(height: 30),
          AutoSizeText(testimonials[i][2]),
          AutoSizeText(testimonials[i][3]),
        ],
      ),
    ],
  );
}

AutoSizeText getTestimonial(i, int orientation) {
  return AutoSizeText(
    testimonials[i][1],
    maxLines: (orientation == 1) ? 10 : 5,
    textAlign: TextAlign.justify,
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
  );
}

Image getTestimonialsImage(BuildContext context, i, int orientation) {
  return Image.network(
    testimonials[i][0],
    height: (orientation == 1) ? 400 : screenHeight(context) * 0.4,
    width: (orientation == 1) ? 350 : screenWidth(context) * 0.6,
  );
}
