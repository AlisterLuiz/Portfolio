import 'package:portfolio_website/utilities/index.dart';

Widget getTestimonialsData(
    BuildContext context, List<Testimonials> testimonials, i, int orientation) {
  ScreenUtil.init(context, allowFontScaling: true);
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        FontAwesomeIcons.quoteLeft,
        size: ScreenUtil().setSp(
          40,
          allowFontScalingSelf: true,
        ),
      ),
      SizedBox(height: 10),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FittedBox(
            child: Container(
              height: (orientation == 2) ? null : screenHeight(context) * 0.53,
              width: (orientation == 2)
                  ? screenWidth(context) * 0.9
                  : screenWidth(context) * 0.57,
              child: AutoSizeText(
                testimonials[i].content,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: (orientation == 2)
                      ? ScreenUtil().setSp(
                          35,
                          allowFontScalingSelf: true,
                        )
                      : ScreenUtil().setSp(
                          18,
                          allowFontScalingSelf: true,
                        ),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          FittedBox(
            child: Container(
              height: (orientation == 2) ? null : screenHeight(context) * 0.05,
              child: AutoSizeText(
                testimonials[i].name,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: (orientation == 2)
                      ? ScreenUtil().setSp(
                          24,
                          allowFontScalingSelf: true,
                        )
                      : ScreenUtil().setSp(
                          10,
                          allowFontScalingSelf: true,
                        ),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          FittedBox(
            child: Container(
              height: (orientation == 2) ? null : screenHeight(context) * 0.05,
              child: AutoSizeText(
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
                          10,
                          allowFontScalingSelf: true,
                        ),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
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
