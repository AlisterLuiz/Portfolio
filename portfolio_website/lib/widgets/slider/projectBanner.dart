import 'dart:ui';

import 'package:Portfolio/utilities/index.dart';
import 'package:Portfolio/widgets/slider/slide_dots.dart';
import 'package:Portfolio/widgets/slider/slide_item.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class ProjectBanner extends StatefulWidget {
  final List slideList;
  ProjectBanner({this.slideList});
  _ProjectBannerState createState() => _ProjectBannerState();
}

class _ProjectBannerState extends State<ProjectBanner> {
  int _currentPage = 0;
  final InfinityPageController _pageController =
      InfinityPageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    if (widget.slideList.length != 1)
      Timer.periodic(Duration(seconds: 3), (Timer timer) {
        if (_currentPage < 6) {
          _currentPage++;
          _pageController.animateToPage(
            _currentPage,
            duration: Duration(seconds: 1, milliseconds: 500),
            curve: Curves.easeIn,
          );
        }
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.slideList.length == 1)
        ? Container(
            height: screenHeight(context) * 0.4,
            width: screenWidth(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: OptimizedCacheImageProvider(widget.slideList[0]),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Image(
                    image: OptimizedCacheImageProvider(widget.slideList[0]),
                  ),
                ),
              ),
            ),
          )
        : Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              InfinityPageView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: widget.slideList.length,
                itemBuilder: (ctx, i) => SlideItem(widget.slideList[i]),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < widget.slideList.length; i++)
                    if (i == _currentPage) SlideDots(true) else SlideDots(false)
                ],
              )
            ],
          );
  }
}
