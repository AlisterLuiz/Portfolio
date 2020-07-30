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
    ScreenUtil.init(context, allowFontScaling: true);
    ScreenUtil().setSp(24, allowFontScalingSelf: true);
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
                      itemCount: (project.length / 3).ceil(),
                      itemBuilder: (context, i) {
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: screenWidth(context) *
                                0.71 /
                                screenHeight(context) *
                                0.71,
                          ),
                          itemBuilder: (context, index) {
                            count = 3 * i;
                            index = count + index;
                            return (index < project.length)
                                ? Padding(
                                    padding: (index.isOdd)
                                        ? EdgeInsets.only(
                                            top: screenHeight(context) * 0.2,
                                          )
                                        : EdgeInsets.only(
                                            bottom: screenHeight(context) * 0.2,
                                          ),
                                    child: Container(
                                      height: screenHeight(context) * 0.5,
                                      margin: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: CarouselSlider(
                                              items: getElementsLength(
                                                project[index].images.length,
                                              ).map((i) {
                                                return Image.network(
                                                  project[index].images[i],
                                                  fit: BoxFit.fill,
                                                  width: screenWidth(context),
                                                );
                                              }).toList(),
                                              options: CarouselOptions(
                                                autoPlay: true,
                                                enableInfiniteScroll: false,
                                                autoPlayAnimationDuration:
                                                    Duration(seconds: 2),
                                                viewportFraction: 1,
                                                height: screenHeight(context) *
                                                    0.26,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: FittedBox(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      screenWidth(context) *
                                                          0.01,
                                                ),
                                                child: AutoSizeText(
                                                  project[index].projectName,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(
                                                      24,
                                                      allowFontScalingSelf:
                                                          true,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
