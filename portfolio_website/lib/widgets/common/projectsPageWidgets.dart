import 'package:portfolio_website/utilities/index.dart';

Map currentProject = {
  1: 'Mobile App Development',
  2: 'Full Stack Development',
  3: 'Machine Learning Projects',
  4: 'Academic Projects',
};

Map currentProjectList = {
  1: 'Mobile',
  2: 'Full Stack',
  3: 'ML',
  4: 'Academic',
};

Map onSelected = {
  1: false,
  2: false,
  3: false,
  4: false,
};

Widget getMapper(Projects project, String map) {
  Map linkMapper = {
    "LinkedIn": getLink(
        project, FontAwesomeIcons.linkedinIn, Color(0xff0072b1), 'LinkedIn'),
    "GitHub":
        getLink(project, FontAwesomeIcons.github, Color(0xff211F1F), 'GitHub'),
    "Website":
        getLink(project, FontAwesomeIcons.globe, Color(0xffFF0000), 'Website'),
    "Paper":
        getLink(project, FontAwesomeIcons.scroll, Color(0xff00ccbb), 'Paper'),
    "Slides": getLink(
        project, FontAwesomeIcons.filePowerpoint, Color(0xfff5b912), 'Slides'),
  };
  return linkMapper[map];
}

Widget getTechStack(BuildContext context, String stackName, int orientation) {
  return Container(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: (orientation == 1) ? 5 : 5),
      child: Center(
        child: RaisedButton(
          textColor: Color(0xff8240D8),
          color: Theme.of(context).primaryColor,
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                stackName,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    ),
  );
}

Widget getLink(Projects project, IconData icon, Color color, String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: RaisedButton(
      textColor: Colors.white,
      color: color,
      elevation: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            // color: Theme.of(context).primaryColor,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              // color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      onPressed: () {
        launchURL(project.links[text]);
      },
    ),
  );
}

Widget getLinks(BuildContext context, Projects project) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < project.links.length; i++)
          getMapper(project, project.links.keys.toList()[i])
      ],
    ),
  );
}

Widget getProjectList(BuildContext context, Projects project, int orientation) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: Theme.of(context).primaryColor,
      ),
    ),
    child: Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CarouselSlider(
            items: getElementsLength(project.images.length).map((i) {
              return Image.network(
                project.images[i],
                fit: BoxFit.fill,
                width: screenWidth(context),
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: Duration(seconds: 2),
              viewportFraction: 1,
              height: screenHeight(context) * 0.28,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: screenHeight(context) * 0.24,
              minHeight: screenHeight(context) * 0.15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    project.projectName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                Column(
                  children: [
                    AutoSizeText(
                      'Stack',
                      style: TextStyle(),
                      minFontSize: 12,
                      maxFontSize: 16,
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: (project.stack != null)
                          ? (project.stack.length > 3)
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        for (int i = 0; i < 3; i++)
                                          getTechStack(context,
                                              project.stack[i], orientation),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        for (int i = 3;
                                            i < project.stack.length;
                                            i++)
                                          getTechStack(context,
                                              project.stack[i], orientation),
                                      ],
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    for (int i = 0;
                                        i < project.stack.length;
                                        i++)
                                      getTechStack(context, project.stack[i],
                                          orientation),
                                  ],
                                )
                          : Container(),
                    ),
                  ],
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: getLinks(context, project),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget displayProjects(BuildContext context, Map projects, int projectID,
    String projectName, int orientation) {
  CarouselController _controller = CarouselController();
  List<Projects> currentProject = projects[currentProjectList[projectID]];
  return (projectID == 0)
      ? Container()
      : Column(
          mainAxisAlignment: (orientation == 1)
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          crossAxisAlignment: (orientation == 1)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            (orientation == 1)
                ? Column(
                    children: [
                      Container(
                        width: screenWidth(context) * 0.6,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                projectName,
                                style: TextStyle(fontSize: 30),
                              ),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _controller.previousPage();
                                      },
                                      child: Icon(Icons.keyboard_arrow_left,
                                          size: 60),
                                    ),
                                    SizedBox(width: 40),
                                    InkWell(
                                      onTap: () {
                                        _controller.nextPage();
                                      },
                                      child: Icon(Icons.keyboard_arrow_right,
                                          size: 60),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                : Container(),
            CarouselSlider(
              items: getElementsLength(currentProject.length).map((i) {
                return getProjectList(context, currentProject[i], orientation);
              }).toList(),
              options: CarouselOptions(
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                viewportFraction: (orientation == 1) ? 0.4 : 0.8,
                height: screenHeight(context) * 0.56,
              ),
              carouselController: _controller,
            ),
            SizedBox(height: 10),
          ],
        );
}

Widget getTopicCardContainer(
    BuildContext context, IconData icon, String topic, int projectID) {
  return Container(
    width: screenWidth(context) * 0.2,
    height: screenHeight(context) * 0.15,
    decoration: BoxDecoration(
      border: Border.all(
        color: Theme.of(context).primaryColor,
      ),
      color: (onSelected[projectID] == true)
          ? Theme.of(context).primaryColor
          : null,
    ),
    child: FittedBox(
      fit: BoxFit.fitWidth,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: (onSelected[projectID] == true)
                  ? Theme.of(context).scaffoldBackgroundColor
                  : null,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              topic,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: (onSelected[projectID] == true)
                    ? Theme.of(context).scaffoldBackgroundColor
                    : null,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget getTab(IconData icon, String text) {
  return Tab(
    child: FittedBox(
      fit: BoxFit.fitWidth,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 5),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
