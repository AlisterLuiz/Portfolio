import 'package:portfolio_website/utilities/index.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final controller = PageController(
    initialPage: 1,
  );

  Widget build(BuildContext context) {
    final List<Widget> _children = [
      WelcomePage(),
      ProjectsPage(),
      BlogPage(),
      TestimonialsPage(),
      AboutPage(),
    ];
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: EdgeInsets.all(70.0),
            child: ListView(
              children: [
                Row(
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
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 60),
                        indicatorColor: Theme.of(context).accentColor,
                        isScrollable: false,
                        labelColor: Theme.of(context).primaryColor,
                        unselectedLabelColor: Colors.white30,
                        onTap: (int i) {
                          onTappedBar(i);
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
                              'Blog',
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
                _children[_currentIndex],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
