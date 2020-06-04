import 'package:portfolio_website/utilities/index.dart';

class BlogPageLandscape extends StatefulWidget {
  @override
  _BlogPageLandscapeState createState() => _BlogPageLandscapeState();
}

class _BlogPageLandscapeState extends State<BlogPageLandscape> {
  bool widgetType = false;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Latest Blogs',
              style: TextStyle(
                fontSize: 35,
                // fontWeight: FontWeight.w700,
              ),
            ),
            Row(children: [
              InkWell(
                onTap: () {
                  setState(() {
                    widgetType = (!widgetType);
                  });
                },
                child: (widgetType == false)
                    ? Icon(
                        FontAwesomeIcons.search,
                      )
                    : Row(
                        children: [
                          FittedBox(
                            child: Container(
                              width: screenWidth(context) * 0.2,
                              height: 50,
                              child: TextField(
                                // controller: _controller,
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
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                  ),
                                  // border: Border.all(color:)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.close,
                          ),
                        ],
                      ),
              ),
              SizedBox(width: 30),
              Icon(
                FontAwesomeIcons.filter,
              )
            ])
          ],
        ),
        SizedBox(height: 20),
        FittedBox(
          fit: BoxFit.fitHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: screenWidth(context) * 0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          _controller.previousPage();
                        },
                        child: Icon(Icons.keyboard_arrow_left, size: 60),
                      ),
                    ),
                    SizedBox(width: 40),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          _controller.nextPage();
                        },
                        child: Icon(Icons.keyboard_arrow_right, size: 60),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Container(
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
                          // elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                  // height: screenHeight(context) * 0.13,
                                  // width: screenWidth(context) * 0.6,
                                  child: FittedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AutoSizeText(
                                          blogs[i][1],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17),
                                          maxLines: 2,
                                          minFontSize: 15,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
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
                                    ),
                                  ),
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
                    // viewportFraction: 0.6,
                    // height: screenHeight(context) * 0.55,
                  ),
                  carouselController: _controller,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
