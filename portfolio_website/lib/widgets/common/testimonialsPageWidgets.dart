import 'package:portfolio_website/utilities/index.dart';

Column getTestimonialsData(BuildContext context, i) {
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
  );
}

Image getTestimonialsImage(i) {
  return Image.network(
    testimonials[i][0],
    height: 400,
    width: 350,
  );
}
