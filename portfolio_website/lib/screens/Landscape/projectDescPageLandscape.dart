import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/widgets/slider/projectBanner.dart';

class ProjectDescriptionLandscape extends StatelessWidget {
  final Projects project;
  ProjectDescriptionLandscape({this.project});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          Container(
            height: screenHeight(context) * 0.4,
            child: ProjectBanner(
              slideList: project.images,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight(context) * 0.05,
              horizontal: screenHeight(context) * 0.05,
            ),
            child: Container(
              height: screenHeight(context) * 0.5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: screenHeight(context) * 0.35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project.projectName,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(
                                    30,
                                    allowFontScalingSelf: true,
                                  ),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tech Stack',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(
                                        20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 30.0),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      itemCount: project.stack.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return getTechStack(
                                            context, project.stack[index]);
                                      },
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio:
                                            MediaQuery.of(context).size.width /
                                                (MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    1.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 30.0),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: project.links.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return getMapper(
                                      context,
                                      project,
                                      project.links.keys.toList()[index],
                                    );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: ScreenUtil().setSp(
                              30,
                              allowFontScalingSelf: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Anim occaecat mollit et occaecat ipsum occaecat consectetur sint fugiat in veniam sint. Sint occaecat aute in ex qui ex ut ullamco.',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(
                          24,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
