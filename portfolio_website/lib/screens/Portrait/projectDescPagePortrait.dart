import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:Portfolio/utilities/index.dart';
import 'package:Portfolio/widgets/slider/projectBanner.dart';

class ProjectDescriptionPortrait extends StatefulWidget {
  final Projects project;
  ProjectDescriptionPortrait({this.project});

  @override
  _ProjectDescriptionPortraitState createState() =>
      _ProjectDescriptionPortraitState();
}

class _ProjectDescriptionPortraitState extends State<ProjectDescriptionPortrait>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  final scrollController = ScrollController();

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
      body: (UniversalPlatform.isWeb)
          ? Scrollbar(
              isAlwaysShown: true,
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                child: getChild(context),
              ),
            )
          : getChild(context),
    );
  }

  Widget getChild(BuildContext context) {
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
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
            Positioned(
              left: 20,
              top: 20,
              child: InkWell(
                onTap: () {
                  print('Pressed');
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).accentColor,
                  size: ScreenUtil().setSp(
                    100,
                    allowFontScalingSelf: true,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Center(
          child: TyperAnimatedTextKit(
              text: [
                widget.project.projectName,
              ],
              textStyle: TextStyle(
                fontSize: ScreenUtil().setSp(
                  60,
                  allowFontScalingSelf: true,
                ),
                fontWeight: FontWeight.bold,
              ),
              speed: Duration(milliseconds: 100),
              isRepeatingAnimation: false,
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Column(
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: TyperAnimatedTextKit(
                        text: [
                          'Tech Stack',
                        ],
                        textStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(
                            40,
                            allowFontScalingSelf: true,
                          ),
                        ),
                        speed: Duration(milliseconds: 100),
                        isRepeatingAnimation: false,
                        textAlign: TextAlign.start,
                        alignment: AlignmentDirectional
                            .topStart // or Alignment.topLeft
                        ),
                  ),
                  AnimationLimiter(
                    child: Container(
                      alignment: Alignment.center,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: widget.project.stack.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Expanded(
                            child: AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: Duration(milliseconds: 800),
                              delay: Duration(milliseconds: 300),
                              columnCount: 6,
                              child: FadeInAnimation(
                                child: getTechStack(
                                  context,
                                  widget.project.stack[index],
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 4.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              FadeTransition(
                opacity: animation,
                child: Text(
                  widget.project.text,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(
                      40,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: AnimationLimiter(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: widget.project.links.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Expanded(
                        child: AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: Duration(milliseconds: 800),
                          delay: Duration(milliseconds: 300),
                          columnCount:
                              widget.project.links.keys.toList()[index].length,
                          child: FadeInAnimation(
                            child: getMapper(
                              context,
                              widget.project,
                              widget.project.links.keys.toList()[index],
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 4.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
