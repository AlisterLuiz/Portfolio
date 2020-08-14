import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/widgets/parallaxCard.dart';

List categories = [
  ['assets/images/mobileApp.png', FontAwesomeIcons.mobileAlt, 'Mobile Apps'],
  ['assets/images/fullStack.jpg', Icons.laptop_chromebook, 'Full Stack'],
  ['assets/images/ML.png', Icons.graphic_eq, 'Machine Learning'],
  ['assets/images/academic.jpg', FontAwesomeIcons.userGraduate, 'Academic'],
];

Map onSelected = {
  1: false,
  2: false,
  3: false,
  4: false,
};

Map currentProjectList = {
  1: 'Mobile',
  2: 'Full Stack',
  3: 'ML',
  4: 'Academic',
};

Map currentProject = {
  1: 'Mobile App Development',
  2: 'Full Stack Development',
  3: 'Machine Learning Projects',
  4: 'Academic Projects',
};

Widget getProjectCategories(
    BuildContext context, int orientation, Function setState) {
  final currentProjectID = Provider.of<CurrentProjectIDProvider>(context);
  bool hover = false;
  List<List<double>> positionLandscape = [
    [-250, -250],
    [250, -250],
    [-250, 250],
    [250, 250]
  ];
  List<List<double>> positionPortrait = [
    [-800, 0],
    [800, 0],
    [-800, 0],
    [800, 0]
  ];
  return LayoutBuilder(
    builder: (context, constraint) {
      return AnimationLimiter(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == 1) ? 2 : 1,
            childAspectRatio: (orientation == 1)
                ? screenWidth(context) * 1.1 / screenHeight(context) * 1.1
                : screenWidth(context) * 2 / screenHeight(context) * 2,
          ),
          itemBuilder: (context, index) {
            return (UniversalPlatform.isWeb)
                ? AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 300),
                    columnCount: 4,
                    child: SlideAnimation(
                      horizontalOffset: (orientation == 1)
                          ? positionLandscape[index][0]
                          : positionPortrait[index][0],
                      verticalOffset: (orientation == 1)
                          ? positionLandscape[index][1]
                          : positionPortrait[index][1],
                      child: ParallaxCard(
                        image: categories[index][0],
                        icon: categories[index][1],
                        text: categories[index][2],
                        orientation: orientation,
                        currentID: currentProjectID,
                        index: index,
                      ),
                    ),
                  )
                : AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 300),
                    columnCount: 4,
                    child: SlideAnimation(
                      horizontalOffset: (orientation == 1)
                          ? positionLandscape[index][0]
                          : positionPortrait[index][0],
                      verticalOffset: (orientation == 1)
                          ? positionLandscape[index][1]
                          : positionPortrait[index][1],
                      child: GestureDetector(
                        onTap: () {
                          currentProjectID.setIndex(index + 1);
                        },
                        child: GFCard(
                          elevation: (hover == true) ? 5 : 1,
                          boxFit: BoxFit.cover,
                          imageOverlay: NetworkImage(categories[index][0]),
                          title: GFListTile(
                            icon: FittedBox(child: Icon(categories[index][1])),
                            title: FittedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    categories[index][2],
                                  ),
                                  SizedBox(height: 2),
                                  Container(
                                    height: 5,
                                    width: 30,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      );
    },
  );
}

Widget getTechStack(BuildContext context, String stackName) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1.0),
    ),
    color: Theme.of(context).primaryColor,
    elevation: 4,
    child: FittedBox(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: AutoSizeText(
          stackName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(
              14,
              allowFontScalingSelf: true,
            ),
            fontWeight: FontWeight.w600,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
    ),
  );
}

Widget getMapper(BuildContext context, Projects project, String map) {
  Map linkMapper = {
    "LinkedIn": getLink(context, project, FontAwesomeIcons.linkedinIn,
        Color(0xff0072b1), 'LinkedIn'),
    "GitHub": getLink(
        context, project, FontAwesomeIcons.github, Color(0xff211F1F), 'GitHub'),
    "Website": getLink(
        context, project, FontAwesomeIcons.globe, Color(0xffFF0000), 'Website'),
    "Paper": getLink(
        context, project, FontAwesomeIcons.scroll, Color(0xff00ccbb), 'Paper'),
    "Slides": getLink(context, project, FontAwesomeIcons.filePowerpoint,
        Color(0xfff5b912), 'Slides'),
  };
  return linkMapper[map];
}

Widget getLink(BuildContext context, Projects project, IconData icon,
    Color color, String text) {
  return InkWell(
    onTap: () {
      launchURL(project.links[text]);
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),
      color: color,
      elevation: 4,
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                // // color: Theme.of(context).primaryColor,
                size: ScreenUtil().setSp(
                  18,
                  allowFontScalingSelf: true,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: ScreenUtil().setSp(
                    18,
                    allowFontScalingSelf: true,
                  ),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
