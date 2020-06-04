import 'package:portfolio_website/utilities/index.dart';

class ProjectsPageLandscape extends StatefulWidget {
  @override
  _ProjectsPageLandscapeState createState() => _ProjectsPageLandscapeState();
}

class _ProjectsPageLandscapeState extends State<ProjectsPageLandscape> {
  // String currentProject = '';
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

  Widget getTechStack() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
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

  Widget getLink(IconData icon, String text) {
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

  Widget getLinks() {
    return Container(
      // width: screenWidth(context) * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          getLink(FontAwesomeIcons.linkedinIn, 'LinkedIn'),
          // SizedBox(
          //   width: screenWidth(context) * 0.01,
          // ),
          getLink(FontAwesomeIcons.github, 'GitHub'),
        ],
      ),
    );
  }

  Widget getProjectList() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).primaryColor,
        ),
        // borderRadius: BorderRadius.all(30),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        getTechStack(),
                        getTechStack(),
                        getTechStack()
                      ],
                    ),
                    SizedBox(height: 5),
                    getLinks(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget displayProjects(int projectID, String projectName) {
    CarouselController _controller = CarouselController();

    return (projectID == 0)
        ? Container()
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                              child: Icon(Icons.keyboard_arrow_left, size: 60),
                            ),
                            SizedBox(width: 40),
                            InkWell(
                              onTap: () {
                                _controller.nextPage();
                              },
                              child: Icon(Icons.keyboard_arrow_right, size: 60),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              CarouselSlider(
                items: getElementsLength(blogs.length).map((i) {
                  return InkWell(
                    onTap: () {},
                    child: getProjectList(),
                  );
                }).toList(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 0.4,
                  height: screenHeight(context) * 0.55,
                ),
                carouselController: _controller,
              ),
              SizedBox(height: 10),
            ],
          );
  }

  Widget getTopicCard(
      BuildContext context, IconData icon, String topic, int projectID) {
    final currentID = Provider.of<CurrentProjectIDProvider>(context);

    return InkWell(
      onTap: () {
        setState(() {
          currentID.setIndex(projectID);
          onSelected[projectID] = true;
          for (int i = 0; i < onSelected.length; i++)
            if (i != projectID) onSelected[i] = false;
        });
      },
      child: Container(
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
      ),
    );
  }

  Widget build(BuildContext context) {
    final currentID = Provider.of<CurrentProjectIDProvider>(context);

    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(height:)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: screenWidth(context) * 0.2,
              child: Column(
                children: [
                  getTopicCard(context, FontAwesomeIcons.mobileAlt,
                      'Mobile App Development', 1),
                  SizedBox(
                    height: 20,
                  ),
                  getTopicCard(context, Icons.laptop_chromebook,
                      'Full Stack Development', 2),
                  SizedBox(
                    height: 20,
                  ),
                  getTopicCard(context, Icons.graphic_eq,
                      'Machine Learning Projects', 3),
                  SizedBox(
                    height: 20,
                  ),
                  getTopicCard(context, FontAwesomeIcons.userGraduate,
                      'Academic Projects', 4),
                ],
              ),
            ),
            Container(
              width: screenWidth(context) * 0.6,
              child: displayProjects(
                  currentID.getIndex(), currentProject[currentID.getIndex()]),
            ),
          ],
        ),
      ],
    );
  }
}
