import 'package:portfolio_website/utilities/index.dart';

class NavBarPortrait extends StatefulWidget {
  @override
  _NavBarPortraitState createState() => _NavBarPortraitState();
}

class _NavBarPortraitState extends State<NavBarPortrait> {
  final controller = PageController(
    initialPage: 1,
  );

  final List<Widget> _children = [
    WelcomePagePortrait(),
    ProjectsPagePortrait(),
    BlogPagePortrait(),
    TestimonialsPagePortrait(),
    AboutPagePortrait(),
  ];

  Widget build(BuildContext context) {
    final _currentIndex = Provider.of<CurrentPageProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
          padding: EdgeInsets.only(
            left: screenWidth(context) * 0.1,
            right: screenWidth(context) * 0.1,
            top: screenHeight(context) * 0.05,
          ),
          child: _children[_currentIndex.getIndex()]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex.getIndex(),
        onTap: (index) {
          setState(() {
            _currentIndex.setIndex(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color(0xffA5A5A5),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              semanticLabel: 'Welcome Page',
            ),
            title: Text(
              'Home',
              style: kNavigationBarTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.code,
              semanticLabel: 'Projects Page',
            ),
            title: Text(
              'Projects',
              style: kNavigationBarTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.rate_review,
              semanticLabel: 'Blog Page',
            ),
            title: Text(
              'Blogs',
              style: kNavigationBarTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.record_voice_over,
              semanticLabel: 'Testimonials Page',
            ),
            title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Testimonials',
                style: kNavigationBarTextStyle,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              semanticLabel: 'About Page',
            ),
            title: Text(
              'About',
              style: kNavigationBarTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
