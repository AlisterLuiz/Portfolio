import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/widgets/slider/projectBanner.dart';

class ProjectDescriptionLandscape extends StatefulWidget {
  final Projects project;
  ProjectDescriptionLandscape({this.project});

  @override
  _ProjectDescriptionLandscapeState createState() =>
      _ProjectDescriptionLandscapeState();
}

class _ProjectDescriptionLandscapeState
    extends State<ProjectDescriptionLandscape>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          FadeTransition(
            opacity: animation,
            child: Container(
              height: screenHeight(context) * 0.45,
              child: ProjectBanner(
                slideList: widget.project.images,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight(context) * 0.05,
              horizontal: screenHeight(context) * 0.05,
            ),
            child: Container(
              height: screenHeight(context) * 0.4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: screenHeight(context) * 0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TyperAnimatedTextKit(
                                  text: [
                                    widget.project.projectName,
                                  ],
                                  textStyle: TextStyle(
                                    fontSize: ScreenUtil().setSp(
                                      30,
                                      allowFontScalingSelf: true,
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  speed: Duration(milliseconds: 100),
                                  isRepeatingAnimation: false,
                                  textAlign: TextAlign.start,
                                  alignment: AlignmentDirectional
                                      .topStart // or Alignment.topLeft
                                  ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TyperAnimatedTextKit(
                                      text: [
                                        'Tech Stack',
                                      ],
                                      textStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(
                                          20,
                                          allowFontScalingSelf: true,
                                        ),
                                      ),
                                      speed: Duration(milliseconds: 100),
                                      isRepeatingAnimation: false,
                                      textAlign: TextAlign.start,
                                      alignment: AlignmentDirectional
                                          .topStart // or Alignment.topLeft
                                      ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 30.0),
                                    child: AnimationLimiter(
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: widget.project.stack.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return AnimationConfiguration
                                              .staggeredGrid(
                                            position: index,
                                            duration:
                                                Duration(milliseconds: 800),
                                            delay: Duration(milliseconds: 300),
                                            columnCount: 6,
                                            child: FadeInAnimation(
                                              child: getTechStack(
                                                context,
                                                widget.project.stack[index],
                                              ),
                                            ),
                                          );
                                        },
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio:
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  (MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 30.0),
                                child: AnimationLimiter(
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: widget.project.links.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return AnimationConfiguration
                                          .staggeredGrid(
                                        position: index,
                                        duration: Duration(milliseconds: 800),
                                        delay: Duration(milliseconds: 300),
                                        columnCount: 2,
                                        child: FadeInAnimation(
                                          child: getMapper(
                                            context,
                                            widget.project,
                                            widget.project.links.keys
                                                .toList()[index],
                                          ),
                                        ),
                                      );
                                    },
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: MediaQuery.of(context)
                                              .size
                                              .width /
                                          (MediaQuery.of(context).size.height /
                                              2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: ScreenUtil().setSp(
                              30,
                              allowFontScalingSelf: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: FadeTransition(
                      opacity: animation,
                      child: AutoSizeText(
                        widget.project.text,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(
                            24,
                            allowFontScalingSelf: true,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
