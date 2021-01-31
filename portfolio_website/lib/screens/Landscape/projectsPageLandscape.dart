import 'package:Portfolio/screens/Portrait/projectDescPagePortrait.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:Portfolio/screens/Landscape/projectDescPageLandscape.dart';
import 'package:Portfolio/utilities/index.dart';

class ProjectsPageLandscape extends StatefulWidget {
  @override
  _ProjectsPageLandscapeState createState() => _ProjectsPageLandscapeState();
}

class _ProjectsPageLandscapeState extends State<ProjectsPageLandscape> {
  PageController controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final currentProjectID = Provider.of<CurrentProjectIDProvider>(context);
    final projects = Provider.of<Map<String, List<Projects>>>(context);
    List<Projects> project =
        projects[currentProjectList[currentProjectID.getIndex()]];
    int count = 0;
    ScreenUtil.init(context, allowFontScaling: true);
    ScreenUtil().setSp(30, allowFontScalingSelf: true);

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
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      itemCount: (project.length / 3).ceil(),
                      itemBuilder: (context, i) {
                        return AnimationLimiter(
                          child: GridView.builder(
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
                                  ? AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration: Duration(milliseconds: 800),
                                      delay: Duration(milliseconds: 300),
                                      columnCount: 6,
                                      child: FadeInAnimation(
                                        child: FlipAnimation(
                                          flipAxis: FlipAxis.x,
                                          child: FlipAnimation(
                                            flipAxis: FlipAxis.y,
                                            child: Padding(
                                              padding: (index.isOdd)
                                                  ? EdgeInsets.only(
                                                      top: screenHeight(
                                                              context) *
                                                          0.2,
                                                    )
                                                  : EdgeInsets.only(
                                                      bottom: screenHeight(
                                                              context) *
                                                          0.2,
                                                    ),
                                              child: InkWell(
                                                onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        BaseWidget<
                                                            HomeViewModel>(
                                                      viewModel:
                                                          HomeViewModel(),
                                                      onModelReady: (model) =>
                                                          model.initialise(),
                                                      child: ScreenTypeLayout(
                                                        mobile:
                                                            OrientationLayout(
                                                          portrait: (context) =>
                                                              ProjectDescriptionPortrait(
                                                                  project:
                                                                      project[
                                                                          index]),
                                                          landscape: (context) =>
                                                              ProjectDescriptionLandscape(
                                                                  project:
                                                                      project[
                                                                          index]),
                                                        ),
                                                        tablet:
                                                            OrientationLayout(
                                                          portrait: (context) =>
                                                              ProjectDescriptionPortrait(
                                                                  project:
                                                                      project[
                                                                          index]),
                                                          landscape: (context) =>
                                                              ProjectDescriptionLandscape(
                                                                  project:
                                                                      project[
                                                                          index]),
                                                        ),
                                                        desktop:
                                                            OrientationLayout(
                                                          portrait: (context) =>
                                                              ProjectDescriptionPortrait(
                                                                  project:
                                                                      project[
                                                                          index]),
                                                          landscape: (context) =>
                                                              ProjectDescriptionLandscape(
                                                                  project:
                                                                      project[
                                                                          index]),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                child: Container(
                                                  height:
                                                      screenHeight(context) *
                                                          0.5,
                                                  margin: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 2,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: CarouselSlider(
                                                          items:
                                                              getElementsLength(
                                                            project[index]
                                                                .images
                                                                .length,
                                                          ).map((i) {
                                                            return Image
                                                                .network(
                                                              project[index]
                                                                  .images[i],
                                                              fit: BoxFit.fill,
                                                              width:
                                                                  screenWidth(
                                                                      context),
                                                            );
                                                          }).toList(),
                                                          options:
                                                              CarouselOptions(
                                                            autoPlay: true,
                                                            enableInfiniteScroll:
                                                                false,
                                                            autoPlayAnimationDuration:
                                                                Duration(
                                                                    seconds: 2),
                                                            viewportFraction: 1,
                                                            height: screenHeight(
                                                                    context) *
                                                                0.26,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: FittedBox(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal:
                                                                  screenWidth(
                                                                          context) *
                                                                      0.01,
                                                            ),
                                                            child: AutoSizeText(
                                                              project[index]
                                                                  .projectName,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                fontSize:
                                                                    ScreenUtil()
                                                                        .setSp(
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
                                      ),
                                    )
                                  : Container();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: screenHeight(context) * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth(context) * 0.04,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              currentPage = 0;
                            });
                            currentProjectID.setIndex(0);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            // size: 30,
                            size: ScreenUtil().setSp(
                              30,
                              allowFontScalingSelf: true,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(width: 5),
                      Expanded(
                        flex: 1,
                        child: Text(
                          currentProjectName[currentProjectID.getIndex()],
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(
                              35,
                              allowFontScalingSelf: true,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          (currentPage != 0)
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      (currentPage > 0)
                                          ? currentPage -= 1
                                          : currentPage = 0;
                                      controller.animateToPage(
                                        currentPage,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: screenWidth(context) * 0.04,
                                    child: Icon(
                                      Icons.chevron_left,
                                      size: ScreenUtil().setSp(
                                        30,
                                        allowFontScalingSelf: true,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          Text(
                            'Page ${currentPage + 1} of ${(project.length / 3).ceil()}',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(
                                30,
                                allowFontScalingSelf: false,
                              ),
                            ),
                          ),
                          // SizedBox(width: 20),
                          (currentPage != (project.length / 3).ceil() - 1)
                              ? Container(
                                  width: screenWidth(context) * 0.04,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        (currentPage <
                                                (project.length / 3).ceil() - 1)
                                            ? currentPage += 1
                                            : currentPage =
                                                (project.length / 3).ceil() - 1;
                                        controller.animateToPage(
                                          currentPage,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      });
                                    },
                                    icon: Icon(
                                      Icons.chevron_right,
                                      size: ScreenUtil().setSp(
                                        30,
                                        allowFontScalingSelf: false,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
