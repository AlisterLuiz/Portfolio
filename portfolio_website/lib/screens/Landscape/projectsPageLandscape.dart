import 'package:portfolio_website/utilities/index.dart';

class ProjectsPageLandscape extends StatefulWidget {
  @override
  _ProjectsPageLandscapeState createState() => _ProjectsPageLandscapeState();
}

class _ProjectsPageLandscapeState extends State<ProjectsPageLandscape> {
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
      child: Column(
        children: [
          getTopicCardContainer(context, icon, topic, projectID),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    final currentID = Provider.of<CurrentProjectIDProvider>(context);
    final projects = Provider.of<Map<String, List<Projects>>>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screenWidth(context) * 0.2,
          child: Column(
            children: [
              getTopicCard(context, FontAwesomeIcons.mobileAlt,
                  'Mobile App Development', 1),
              getTopicCard(context, Icons.laptop_chromebook,
                  'Full Stack Development', 2),
              getTopicCard(
                  context, Icons.graphic_eq, 'Machine Learning Projects', 3),
              getTopicCard(context, FontAwesomeIcons.userGraduate,
                  'Academic Projects', 4),
            ],
          ),
        ),
        Container(
          width: screenWidth(context) * 0.6,
          child: displayProjects(context, projects, currentID.getIndex(),
              currentProject[currentID.getIndex()], 1),
        ),
      ],
    );
  }
}
