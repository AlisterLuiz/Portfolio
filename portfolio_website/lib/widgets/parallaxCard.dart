import 'package:portfolio_website/utilities/index.dart';

class ParallaxCard extends StatefulWidget {
  final String text;
  final String image;
  final IconData icon;
  final int orientation;
  final currentID;
  final int index;
  ParallaxCard(
      {this.text,
      this.icon,
      this.image,
      this.orientation,
      this.currentID,
      this.index});
  _ParallaxCardState createState() => _ParallaxCardState();
}

class _ParallaxCardState extends State<ParallaxCard>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  double localX = 0;
  double localY = 0;
  bool defaultPosition = true;
  bool downButton = false;

  double scaleX = 1;
  double scaleY = 1;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
  }

  void _setupAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    )..addListener(() => setState(() {
          scaleX = animation.value;
          scaleY = animation.value;
        }));
    animation = Tween<double>(begin: 1, end: 0.9).animate(CurvedAnimation(
      curve: Curves.decelerate,
      parent: animationController,
    ));
  }

  void _scaleAnimation() {
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => downButton = true);
        animationController.reverse();
      }
    });
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double percentageX = (localX / (size.width * 0.45) / 2) * 100;
    double percentageY = (localY / ((size.height / 2) + 70) / 1.5) * 100;

    double screen = (size.width - 150) / (1280 - 150);
    screen = screen > 1.0 ? 1.0 : screen < 0 ? 0 : screen;

    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(defaultPosition ? 0 : (1.2 * (percentageY / 50) + -1.2))
            ..rotateY(defaultPosition ? 0 : (-0.3 * (percentageX / 50) + 0.3)),
          alignment: FractionalOffset.center,
          child: MouseRegion(
            onEnter: (_) => setState(() => defaultPosition = false),
            onExit: (_) => setState(() {
              localY = (size.height) / 2;
              localX = (size.width * 0.45) / 2;
              defaultPosition = true;
            }),
            onHover: (details) {
              if (mounted) setState(() => defaultPosition = false);
              if (details.localPosition.dx > 0 &&
                  details.localPosition.dy > 0) {
                if (details.localPosition.dx < (size.width * 0.45) * 1.5 &&
                    details.localPosition.dy > 0) {
                  localX = details.localPosition.dx;
                  localY = details.localPosition.dy;
                }
              }
            },
            child: GestureDetector(
              onTapDown: (_) {
                _scaleAnimation();
                Future.delayed(const Duration(milliseconds: 500), () {
                  widget.currentID.setIndex(widget.index + 1);
                });
              },
              onTapUp: (_) {},
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color(0x70000000),
                    blurRadius: 30,
                    spreadRadius: -30,
                    offset: Offset(0, 60),
                  )
                ]),
                child: Stack(
                  children: [
                    Transform(
                      transform: Matrix4.identity()..scale(scaleX, scaleY),
                      child: Opacity(
                        opacity: 0.8,
                        child: Image.network(
                          widget.image,
                          height: screenHeight(context) * 0.4,
                          width: (widget.orientation == 1)
                              ? screenWidth(context) * 0.45
                              : screenWidth(context) * 0.8,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.identity()..scale(scaleX, scaleY),
                      alignment: FractionalOffset.center,
                      child: Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..translate(
                                      defaultPosition
                                          ? 0.0
                                          : (70 * (percentageX / 50) + -70),
                                      defaultPosition
                                          ? 0.0
                                          : (80 * (percentageY / 50) + -80),
                                      0.0),
                                alignment: FractionalOffset.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: screenWidth(context) * 0.05,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Icon(
                                          widget.icon,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: screenWidth(context) * 0.15,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: AutoSizeText(
                                          widget.text,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
