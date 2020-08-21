import 'package:Portfolio/screens/Landscape/projectDescPageLandscape.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:Portfolio/screens/Portrait/projectDescPagePortrait.dart';
import 'package:Portfolio/utilities/index.dart';

class ProjectsPagePortrait extends StatefulWidget {
  @override
  _ProjectsPagePortraitState createState() => _ProjectsPagePortraitState();
}

class _ProjectsPagePortraitState extends State<ProjectsPagePortrait> {
  int count = 0;

  Widget build(BuildContext context) {
    final projects = Provider.of<Map<String, List<Projects>>>(context);
    final currentProjectID = Provider.of<CurrentProjectIDProvider>(context);
    List<Projects> project =
        projects[currentProjectList[currentProjectID.getIndex()]];
    ScreenUtil.init(context, allowFontScaling: true);
    ScreenUtil().setSp(30, allowFontScalingSelf: true);
    return (currentProjectID.getIndex() == 0)
        ? getProjectCategories(
            context,
            2,
            () => setState(() {}),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FittedBox(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          currentProjectID.setIndex(0);
                          count = 0;
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: ScreenUtil().setSp(
                            30,
                            allowFontScalingSelf: true,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        currentProjectName[currentProjectID.getIndex()],
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(
                            30,
                            allowFontScalingSelf: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: AnimationLimiter(
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    itemCount: (project.length * 2),
                    itemBuilder: (BuildContext context, int index) {
                      if (index.isEven && index != 0) count++;
                      int i = count;
                      return (index.isOdd)
                          ? Container()
                          : AnimationConfiguration.staggeredGrid(
                              position: i,
                              duration: Duration(milliseconds: 800),
                              delay: Duration(milliseconds: 300),
                              columnCount: 6,
                              child: FadeInAnimation(
                                child: FlipAnimation(
                                  flipAxis: FlipAxis.x,
                                  child: FlipAnimation(
                                    flipAxis: FlipAxis.y,
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BaseWidget<HomeViewModel>(
                                            viewModel: HomeViewModel(),
                                            onModelReady: (model) =>
                                                model.initialise(),
                                            child: ScreenTypeLayout(
                                              mobile: OrientationLayout(
                                                portrait: (context) =>
                                                    ProjectDescriptionPortrait(
                                                        project:
                                                            project[i]),
                                                landscape: (context) =>
                                                    ProjectDescriptionLandscape(
                                                        project:
                                                            project[i]),
                                              ),
                                              tablet: OrientationLayout(
                                                portrait: (context) =>
                                                    ProjectDescriptionPortrait(
                                                        project:
                                                            project[i]),
                                                landscape: (context) =>
                                                    ProjectDescriptionLandscape(
                                                        project:
                                                            project[i]),
                                              ),
                                              desktop: OrientationLayout(
                                                portrait: (context) =>
                                                    ProjectDescriptionPortrait(
                                                        project:
                                                            project[i]),
                                                landscape: (context) =>
                                                    ProjectDescriptionLandscape(
                                                        project:
                                                            project[i]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: CarouselSlider(
                                                items: getElementsLength(
                                                  project[count].images.length,
                                                ).map((i) {
                                                  return Image.network(
                                                    project[count].images[i],
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
                                                  height:
                                                      screenHeight(context) *
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
                                                    project[count].projectName,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontSize:
                                                          ScreenUtil().setSp(
                                                        30,
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
                                    ),
                                  ),
                                ),
                              ),
                            );
                    },
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(2, index.isEven ? 2 : 1),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
              ),
            ],
          );
  }
}
