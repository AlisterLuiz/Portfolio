import 'package:portfolio_website/utilities/index.dart';

class ProjectsPageLandscape extends StatefulWidget {
  @override
  _ProjectsPageLandscapeState createState() => _ProjectsPageLandscapeState();
}

class _ProjectsPageLandscapeState extends State<ProjectsPageLandscape> {
  Widget build(BuildContext context) {
    final currentProjectID = Provider.of<CurrentProjectIDProvider>(context);
    final projects = Provider.of<Map<String, List<Projects>>>(context);
    List<Projects> project =
        projects[currentProjectList[currentProjectID.getIndex()]];
    int count = 0;
    return (currentProjectID.getIndex() == 0)
        ? getProjectCategories(
            context,
            1,
            () => setState(() {}),
          )
        : Container(
            height: screenHeight(context) * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    height: screenHeight(context) * 0.6,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (project.length / 4).ceil(),
                      itemBuilder: (context, i) {
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: screenWidth(context) *
                                1.2 /
                                screenHeight(context) *
                                1.2,
                          ),
                          itemBuilder: (context, index) {
                            count = 4 * i;
                            index = count + index;
                            return (index < project.length)
                                ? Container(
                                    margin: EdgeInsets.all(4),
                                    color: Theme.of(context).accentColor,
                                    child: Text(project[index].projectName),
                                  )
                                : Container();
                          },
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: screenHeight(context) * 0.1,
                  child: IconButton(
                    onPressed: () => currentProjectID.setIndex(0),
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
          );
  }
}
