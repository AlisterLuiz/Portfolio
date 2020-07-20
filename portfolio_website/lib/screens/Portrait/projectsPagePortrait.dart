import 'package:portfolio_website/utilities/index.dart';

class ProjectsPagePortrait extends StatefulWidget {
  @override
  _ProjectsPagePortraitState createState() => _ProjectsPagePortraitState();
}

class _ProjectsPagePortraitState extends State<ProjectsPagePortrait> {
  Widget build(BuildContext context) {
    final projects = Provider.of<Map<String, List<Projects>>>(context);
    final currentProjectID = Provider.of<CurrentProjectIDProvider>(context);
    return (currentProjectID.getIndex() == 0)
        ? getProjectCategories(
            context,
            2,
            () => setState(() {}),
          )
        : Text('Hello');
    // return DefaultTabController(
    //   length: 4,
    //   child: ListView(
    //     children: [
    //       TabBar(
    //         isScrollable: true,
    //         labelColor: Theme.of(context).primaryColor,
    //         tabs: [
    //           getTab(FontAwesomeIcons.mobileAlt, 'Mobile Apps'),
    //           getTab(Icons.laptop_chromebook, 'Full Stack'),
    //           getTab(Icons.graphic_eq, 'Machine Learning'),
    //           getTab(FontAwesomeIcons.userGraduate, 'Academic'),
    //         ],
    //       ),
    //       SizedBox(height: 20),
    //       Container(
    //         height: screenHeight(context),
    //         child: TabBarView(children: [
    //           displayProjects(context, projects, 1, currentProject[1], 2),
    //           displayProjects(context, projects, 2, currentProject[2], 2),
    //           displayProjects(context, projects, 3, currentProject[3], 2),
    //           displayProjects(context, projects, 4, currentProject[4], 2),
    //         ]),
    //       ),
    //     ],
    //   ),
    // );
  }
}
