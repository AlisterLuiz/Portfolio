import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/widgets/slider/slide_dots.dart';
import 'package:portfolio_website/widgets/slider/slide_item.dart';

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
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.slideList.length == 1)
        ? Image.network(
            widget.slideList[0],
            fit: BoxFit.fill,
            height: screenHeight(context) * 0.35,
            width: screenWidth(context),
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
