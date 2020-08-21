import 'package:Portfolio/utilities/index.dart';
import 'package:Portfolio/widgets/animations/blogsScreenAnimations.dart';

class BlogPagePortrait extends StatefulWidget {
  @override
  _BlogPagePortraitState createState() => _BlogPagePortraitState();
}

class _BlogPagePortraitState extends State<BlogPagePortrait>
    with SingleTickerProviderStateMixin {
  bool widgetType = false;
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
    CarouselController _controller = CarouselController();

    return AnimatedBuilder(
      animation: animation.controller,
      builder: (context, child) => ListView(
        children: [
          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Container(
                    width: screenWidth(context) * 0.8,
                    child: FadeTransition(
                        opacity: animation.textOpacity, child: getTitle()),
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
          getBlogsCarousel(context, _controller, 2, animation),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
