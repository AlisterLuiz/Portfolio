import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/widgets/common/projectsPageWidgets.dart';

class ProjectsPagePortrait extends StatefulWidget {
  @override
  _ProjectsPagePortraitState createState() => _ProjectsPagePortraitState();
}

class _ProjectsPagePortraitState extends State<ProjectsPagePortrait> {
  Widget build(BuildContext context) {
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
              displayProjects(context, 1, currentProject[1], 2),
              displayProjects(context, 2, currentProject[2], 2),
              displayProjects(context, 3, currentProject[3], 2),
              displayProjects(context, 4, currentProject[4], 2),
            ]),
          ),
        ],
      ),
    );
  }
}
