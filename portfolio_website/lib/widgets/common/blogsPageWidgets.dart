import 'package:portfolio_website/utilities/index.dart';

AutoSizeText getTitle() {
  return AutoSizeText(
    'Latest Blogs',
    style: TextStyle(
      fontSize: 35,
    ),
  );
}

Widget getSearchFilterIcon(
    BuildContext context, bool widgetType, int orientation) {
  return (widgetType == false)
      ? Icon(
          FontAwesomeIcons.search,
        )
      : Row(
          children: [
            FittedBox(
              child: Container(
                width: (orientation == 1)
                    ? screenWidth(context) * 0.2
                    : screenWidth(context) * 0.45,
                height: 50,
                child: TextField(
                  onChanged: (value) {},
                  textAlign: TextAlign.left,
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                  ),
                  decoration: konboardingtextdecoration.copyWith(
                    labelText: "Search",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Icon(
              Icons.close,
            ),
          ],
        );
}

Widget getBlogsCarousel(
    BuildContext context, CarouselController _controller, int orientation) {
  final CarouselController _controller = CarouselController();

  return Container(
    width: screenWidth(context) * 0.6,
    child: CarouselSlider(
      items: getElementsLength(blogs.length).map((i) {
        return InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: Card(
              color: Theme.of(context).scaffoldBackgroundColor,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(blogs[i][0]),
                    fit: BoxFit.fill,
                    height: screenHeight(context) * 0.34,
                    width: screenWidth(context),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.02,
                    ),
                    child: Container(
                      child: (orientation == 1)
                          ? FittedBox(
                              child: getBlogDetails(i),
                            )
                          : getBlogDetails(i),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: (orientation == 1) ? null : screenHeight(context) * 0.55,
      ),
      carouselController: _controller,
    ),
  );
}

Column getBlogDetails(i) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      AutoSizeText(
        blogs[i][1],
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
        maxLines: 2,
        minFontSize: 15,
      ),
      SizedBox(
        height: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AutoSizeText(
            blogs[i][2],
            maxFontSize: 14,
          ),
          AutoSizeText(
            blogs[i][3],
            maxFontSize: 14,
          ),
        ],
      ),
    ],
  );
}
