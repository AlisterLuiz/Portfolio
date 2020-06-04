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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getTitle(),
            Row(children: [
              InkWell(
                onTap: () {
                  setState(() {
                    widgetType = (!widgetType);
                  });
                },
                child: getSearchFilterIcon(context, widgetType, 1),
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
                child: getBlogsCarousel(context, _controller, 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
