import 'package:portfolio_website/utilities/index.dart';

Widget getTestimonialsData(
    BuildContext context, List<Testimonials> testimonials, i, int orientation) {
  ScreenUtil.init(context, allowFontScaling: true);
  ScreenUtil().setSp(30, allowFontScalingSelf: true);
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        FontAwesomeIcons.quoteLeft,
        size: ScreenUtil().setSp(
          50,
          allowFontScalingSelf: true,
        ),
      ),
      SizedBox(height: 10),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          getTestimonial(context, testimonials, i, orientation),
          SizedBox(height: 10),
          AutoSizeText(
            testimonials[i].name,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: (orientation == 2)
                  ? ScreenUtil().setSp(
                      24,
                      allowFontScalingSelf: true,
                    )
                  : ScreenUtil().setSp(
                      16,
                      allowFontScalingSelf: true,
                    ),
              fontWeight: FontWeight.w400,
            ),
          ),
          AutoSizeText(
            testimonials[i].position,
            maxLines: 2,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: (orientation == 2)
                  ? ScreenUtil().setSp(
                      24,
                      allowFontScalingSelf: true,
                    )
                  : ScreenUtil().setSp(
                      16,
                      allowFontScalingSelf: true,
                    ),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget getTestimonial(
    BuildContext context, List<Testimonials> testimonials, i, int orientation) {
  return AutoSizeText(
    testimonials[i].content,
    textAlign: TextAlign.left,
    style: TextStyle(
      fontSize: (orientation == 2)
          ? ScreenUtil().setSp(
              35,
              allowFontScalingSelf: true,
            )
          : ScreenUtil().setSp(
              22,
              allowFontScalingSelf: true,
            ),
      fontWeight: FontWeight.w400,
    ),
  );
}

Widget getTestimonialsImage(
    BuildContext context, List<Testimonials> testimonials, i, int orientation) {
  return Image.network(
    testimonials[i].photo,
    height: (orientation == 1)
        ? screenHeight(context) * 0.7
        : screenHeight(context) * 0.4,
    width: (orientation == 1)
        ? screenWidth(context) * 0.3
        : screenWidth(context) * 0.6,
    fit: BoxFit.fill,
  );
}
