import 'package:portfolio_website/utilities/index.dart';

class ProjectsPagePortrait extends StatefulWidget {
  @override
  _ProjectsPagePortraitState createState() => _ProjectsPagePortraitState();
}

class _ProjectsPagePortraitState extends State<ProjectsPagePortrait> {
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
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
      child: FittedBox(
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
      ),
    );
  }

  Widget getLinks() {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getLink(FontAwesomeIcons.linkedinIn, 'LinkedIn'),
          SizedBox(
            width: 20,
          ),
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
              height: screenHeight(context) * 0.35,
              width: screenWidth(context),
            ),
            SizedBox(height: 15),
            Container(
              // width: screenWidth(context) * 0.,
              height: screenHeight(context) * 0.15,
              // padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: FittedBox(
                // fit: BoxFit.fill,
                fit: BoxFit.fitHeight,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      'Project Name',
                      style: TextStyle(
                        fontSize: 20,
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
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          getTechStack(),
                          getTechStack(),
                          getTechStack()
                        ],
                      ),
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: getElementsLength(blogs.length).map((i) {
                  return InkWell(
                    onTap: () {},
                    child: getProjectList(),
                  );
                }).toList(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  // viewportFraction: 0.6,
                  height: screenHeight(context) * 0.55,
                ),
                carouselController: _controller,
              ),
              SizedBox(height: 10),
            ],
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

  Widget build(BuildContext context) {
    // final currentID = Provider.of<CurrentProjectIDProvider>(context);

    return DefaultTabController(
      length: 4,
      child: ListView(
        children: [
          TabBar(
            // labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
            isScrollable: true,
            labelColor: Theme.of(context).primaryColor,
            tabs: [
              getTab(FontAwesomeIcons.mobileAlt, 'Mobile App Development'),
              getTab(Icons.laptop_chromebook, 'Full Stack Development'),
              getTab(Icons.graphic_eq, 'Machine Learning Projects'),
              getTab(FontAwesomeIcons.userGraduate, 'Academic Projects'),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: screenHeight(context),
            child: TabBarView(children: [
              displayProjects(1, currentProject[1]),
              displayProjects(2, currentProject[2]),
              displayProjects(3, currentProject[3]),
              displayProjects(4, currentProject[4]),
            ]),
          ),
        ],
      ),
    );
  }
}
