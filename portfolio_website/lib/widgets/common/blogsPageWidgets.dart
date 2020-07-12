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
  final List<Blogs> blogs = Provider.of<List<Blogs>>(context);
  return Flexible(
    flex: 2,
    child: CarouselSlider(
      items: getElementsLength(blogs.length).map((i) {
        return InkWell(
          onTap: () {
            launchURL(blogs[i].link);
          },
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
                    image: NetworkImage(blogs[i].photo),
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
                      child: getBlogDetails(blogs[i]),
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
        height: screenHeight(context) * 0.55,
        enableInfiniteScroll: false,
      ),
      carouselController: _controller,
    ),
  );
}

Column getBlogDetails(Blogs blog) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      AutoSizeText(
        blog.title,
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
            blog.date,
            maxFontSize: 14,
          ),
          AutoSizeText(
            blog.source,
            maxFontSize: 14,
          ),
        ],
      ),
    ],
  );
}
