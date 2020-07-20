import 'package:portfolio_website/utilities/index.dart';

class ProjectsPageLandscape extends StatefulWidget {
  @override
  _ProjectsPageLandscapeState createState() => _ProjectsPageLandscapeState();
}

class _ProjectsPageLandscapeState extends State<ProjectsPageLandscape> {
  // Widget getTopicCard(
  //     BuildContext context, IconData icon, String topic, int projectID) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         currentID.setIndex(projectID);
  //         onSelected[projectID] = true;
  //         for (int i = 0; i < onSelected.length; i++)
  //           if (i != projectID) onSelected[i] = false;
  //       });
  //     },
  //     child: getTopicCardContainer(context, icon, topic, projectID),
  //   );
  // }

  Widget build(BuildContext context) {
    final currentProjectID = Provider.of<CurrentProjectIDProvider>(context);
    final projects = Provider.of<Map<String, List<Projects>>>(context);

    return (currentProjectID.getIndex() == 0)
        ? getProjectCategories(
            context,
            1,
            () => setState(() {}),
          )
        : Text('Hello');

    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Flexible(
    //       flex: 1,
    //       child: Container(
    //         height: screenHeight(context) * 0.7,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             getTopicCard(context, FontAwesomeIcons.mobileAlt,
    //                 'Mobile Apps', 1),
    //             getTopicCard(context, Icons.laptop_chromebook,
    //                 'Full Stack', 2),
    //             getTopicCard(
    //                 context, Icons.graphic_eq, 'Machine Learning', 3),
    //             getTopicCard(context, FontAwesomeIcons.userGraduate,
    //                 'Academic', 4),
    //           ],
    //         ),
    //       ),
    //     ),
    //     Flexible(
    //       flex: 2,
    //       child: displayProjects(context, projects, currentID.getIndex(),
    //           currentProject[currentID.getIndex()], 1),
    //     ),
    //   ],
    // );
  }
}
