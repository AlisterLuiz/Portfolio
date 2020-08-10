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
                  child: getTitle(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   width: screenWidth(context) * 0.8,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           setState(() {
              //             widgetType = (!widgetType);
              //           });
              //         },
              //         child: getSearchFilterIcon(context, widgetType, 2),
              //       ),
              //       SizedBox(width: 30),
              //       Icon(
              //         FontAwesomeIcons.filter,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
            
            ],
          ),
        ),
        SizedBox(height: 10),
        getBlogsCarousel(context, _controller, 2),
        SizedBox(height: 10),
      ],
    );
  }
}
