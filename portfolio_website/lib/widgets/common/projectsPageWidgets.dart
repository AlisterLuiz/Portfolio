import 'package:portfolio_website/utilities/index.dart';

Map currentProject = {
  1: 'Mobile App Development',
  2: 'Full Stack Development',
  3: 'Machine Learning Projects',
  4: 'Academic Projects',
};

Map onSelected = {
  1: false,
  2: false,
  3: false,
  4: false,
};

Widget getTechStack(BuildContext context, int orientation) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: (orientation == 1) ? 5 : 10),
    child: Center(
      child: RaisedButton(
        textColor: Color(0xff8240D8),
        color: Theme.of(context).primaryColor,
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                color: Theme.of(context).scaffoldBackgroundColor,
                // fontSize: 8,
              ),
            ),
          ],
        ),
        onPressed: () {},
      ),
    ),
  );
}

Widget getLink(BuildContext context, IconData icon, String text) {
  return Container(
    // height: screenHeight(context) * 0.04,
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: RaisedButton(
      textColor: Color(0xff8240D8),
      color: Theme.of(context).primaryColor,
      elevation: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 14,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              color: Theme.of(context).scaffoldBackgroundColor,
              // fontSize: 10.5,
            ),
          ),
        ],
      ),
      onPressed: () {},
    ),
  );
}

Widget getLinks(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        getLink(context, FontAwesomeIcons.linkedinIn, 'LinkedIn'),
        getLink(context, FontAwesomeIcons.github, 'GitHub'),
      ],
    ),
  );
}

Widget getProjectList(BuildContext context, int orientation) {
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            blogs[0][0],
            fit: BoxFit.fill,
            height: screenHeight(context) * 0.33,
            width: screenWidth(context),
          ),
          SizedBox(height: screenHeight(context) * 0.02),
          Container(
            // width: screenWidth(context) * 0.6,
            height: screenHeight(context) * 0.15,
            // padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Column(
                mainAxisAlignment: (orientation == 1)
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Project Name',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                  ),
                  SizedBox(height: 5),
                  AutoSizeText(
                    'Stack',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      getTechStack(context, orientation),
                      getTechStack(context, orientation),
                      getTechStack(context, orientation)
                    ],
                  ),
                  SizedBox(height: 5),
                  getLinks(context),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget displayProjects(
    BuildContext context, int projectID, String projectName, int orientation) {
  CarouselController _controller = CarouselController();

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
              items: getElementsLength(blogs.length).map((i) {
                return InkWell(
                  onTap: () {},
                  child: getProjectList(context, orientation),
                );
              }).toList(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: (orientation == 1) ? 0.4 : 0.8,
                height: screenHeight(context) * 0.55,
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
              color: (onSelected[projectID] == true)
                  ? Theme.of(context).scaffoldBackgroundColor
                  : null,
            ),
            SizedBox(
              width: 10,
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
                fontSize: 13,
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
