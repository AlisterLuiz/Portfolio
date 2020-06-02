import 'package:portfolio_website/utilities/index.dart';

class BlogPagePortrait extends StatefulWidget {
  @override
  _BlogPagePortraitState createState() => _BlogPagePortraitState();
}

class _BlogPagePortraitState extends State<BlogPagePortrait> {
  bool widgetType = false;

  Widget build(BuildContext context) {
    CarouselController _controller = CarouselController();

    return ListView(
      children: [
        FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Container(
                  width: screenWidth(context) * 0.8,
                  child: Text(
                    'Latest Blogs',
                    style: TextStyle(
                      fontSize: 35,
                      // fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: screenWidth(context) * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                          : FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Row(
                                children: [
                                  Container(
                                    width: screenWidth(context) * 0.45,
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
                                      decoration:
                                          konboardingtextdecoration.copyWith(
                                        labelText: "Search",
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 2.0),
                                        ),
                                        // border: Border.all(color:)
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
                    ),
                    SizedBox(width: 30),
                    Icon(
                      FontAwesomeIcons.filter,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        CarouselSlider(
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
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          // height: screenHeight(context) * 0.13,
                          // width: screenWidth(context) * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AutoSizeText(
                                blogs[i][1],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
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
            height: screenHeight(context) * 0.55,
          ),
          carouselController: _controller,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
