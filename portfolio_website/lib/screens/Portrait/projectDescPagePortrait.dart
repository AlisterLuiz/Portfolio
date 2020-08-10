import 'package:portfolio_website/utilities/index.dart';
import 'package:portfolio_website/widgets/slider/projectBanner.dart';

class ProjectDescriptionPortrait extends StatelessWidget {
  final Projects project;
  ProjectDescriptionPortrait({this.project});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight(context) * 0.4,
                  child: ProjectBanner(
                    slideList: project.images,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: InkWell(
                    onTap: () {
                      print('Pressed');
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).accentColor,
                      size: ScreenUtil().setSp(
                        100,
                        allowFontScalingSelf: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                project.projectName,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(
                    60,
                    allowFontScalingSelf: true,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Tech Stack',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(
                              40,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: project.stack.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Expanded(
                                child: getTechStack(
                                  context,
                                  project.stack[index],
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: MediaQuery.of(context)
                                      .size
                                      .width /
                                  (MediaQuery.of(context).size.height / 4.5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    project.text,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(
                        40,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: project.links.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Expanded(
                            child: getMapper(
                              context,
                              project,
                              project.links.keys.toList()[index],
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 4.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
