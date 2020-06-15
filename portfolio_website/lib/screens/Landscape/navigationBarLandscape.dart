import 'package:portfolio_website/utilities/index.dart';

class NavBarLandscape extends StatefulWidget {
  @override
  _NavBarLandscapeState createState() => _NavBarLandscapeState();
}

class _NavBarLandscapeState extends State<NavBarLandscape> {
  final controller = PageController(
    initialPage: 1,
  );

  final List<Widget> _children = [
    WelcomePageLandscape(),
    ProjectsPageLandscape(),
    BlogPageLandscape(),
    TestimonialsPageLandscape(),
    AboutPageLandscape(),
  ];

  Widget build(BuildContext context) {
    final _currentIndex = Provider.of<CurrentPageProvider>(context);

    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: EdgeInsets.only(
              left: screenWidth(context) * 0.05,
              right: screenWidth(context) * 0.05,
              top: screenHeight(context) * 0.1,
            ),
            child: ListView(
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 300,
                            minHeight: 50,
                            maxHeight: 50,
                            maxWidth: 810,
                          ),
                          child: TabBar(
                            indicatorPadding:
                                EdgeInsets.symmetric(horizontal: 60),
                            indicatorColor: Theme.of(context).accentColor,
                            isScrollable: false,
                            labelColor: Theme.of(context).primaryColor,
                            unselectedLabelColor: Colors.white30,
                            onTap: (int i) {
                              setState(() {
                                _currentIndex.setIndex(i);
                              });
                            },
                            tabs: [
                              Tab(
                                child: Text(
                                  'Home',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Projects',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Blogs',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Testimonials',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'About',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight(context) * 0.05,
                  ),
                  child: _children[_currentIndex.getIndex()],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
