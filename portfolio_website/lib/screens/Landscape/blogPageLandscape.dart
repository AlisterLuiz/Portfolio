import 'package:Portfolio/utilities/index.dart';
import 'package:Portfolio/widgets/animations/blogsScreenAnimations.dart';

class BlogPageLandscape extends StatefulWidget {
  @override
  _BlogPageLandscapeState createState() => _BlogPageLandscapeState();
}

class _BlogPageLandscapeState extends State<BlogPageLandscape>
    with SingleTickerProviderStateMixin {
  bool widgetType = false;
  final CarouselController _controller = CarouselController();

  AnimationController controller;
  BlogsScreenAnimation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
    animation = BlogsScreenAnimation(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeTransition(opacity: animation.textOpacity, child: getTitle()),
              // Row(children: [
              //   InkWell(
              //     onTap: () {
              //       setState(() {
              //         widgetType = (!widgetType);
              //       });
              //     },
              //     child: getSearchFilterIcon(context, widgetType, 1),
              //   ),
              //   SizedBox(width: 30),
              //   Icon(
              //     FontAwesomeIcons.filter,
              //   )
              // ])
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          _controller.previousPage();
                        },
                        child: FadeTransition(
                            opacity: animation.icon1Opacity,
                            child: Icon(Icons.keyboard_arrow_left, size: 80)),
                      ),
                    ),
                    SizedBox(width: 40),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          _controller.nextPage();
                        },
                        child: FadeTransition(
                            opacity: animation.icon2Opacity,
                            child: Icon(Icons.keyboard_arrow_right, size: 80)),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: getBlogsCarousel(context, _controller, 1, animation)),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
